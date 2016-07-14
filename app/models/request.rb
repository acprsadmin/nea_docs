class Request < ActiveRecord::Base
  extend EnumerateIt
  has_enumeration_for :requesttype
  has_enumeration_for :origin
  has_enumeration_for :nea_decision

  acts_as_commentable
  has_many :comments




  has_many :site_documents
  has_many :site_images

  belongs_to :user, :foreign_key => :approver_id
  belongs_to :user, :foreign_key => :responder_id
  belongs_to :user, :foreign_key => :creator_id
  belongs_to :user, :foreign_key => :decided_by

  has_many :requestlogs

  def production
    if deployed_on
      return true
    end
  end

  def testing
    if tested_on
      return true
    end
  end
  def development
    if developed_on
      return true
    end
  end

  def approved
    if decided_on and nea_decision == 1
      return true
    end
  end

  def rejected
    if decided_on and nea_decision == 2
      return true
    end
  end

  def onhold
    if decided_on and nea_decision == 4
      return true
    end
  end

  def addinfo
    if decided_on and nea_decision == 3
      return true
    end
  end

  def responded
    if  responded_on and !decided_on
      return true
    end
  end

  def submitted
    if !responded_on and submitted_on
      return true
    end
  end


  def presubmit
    if !submitted_on
      return true
    end
  end

  def fullid
    if self.origin == 1
        vid = '<span style="font-weight: bold; color: green">CR-' + self.id.to_s + '</span>'
     else
       vid = '<span style="font-weight: bold; color: darkblue">PR-' + self.id.to_s + '</span>'
    end
    return self.raw(vid)
  end

  def raw(stringish)

    stringish.to_s.html_safe

  end




def textstatus

  if self.production
    t='Deployed to Production'
  elsif self.testing
    t = 'Testing'
  elsif self.development
    t = 'In Development'
  elsif self.approved
    t = 'NEA Approved'
  elsif self.rejected
    t = 'NEA Rejected'
  elsif self.onhold
    t = 'On Hold/No Decision'
  elsif self.addinfo
    t = 'More Info Required/No Decision'
  elsif self.responded
    t = 'Pillar Response'
  elsif self.submitted
    t = 'NEA Submit to Pillar'
  elsif self.presubmit
    t = 'NEA Create'
  else
    t = 'N/A'
  end
  return t


end








end
