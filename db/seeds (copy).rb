user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email



User.create(email: 'smetzger@pillarsystems.com', password: 'cantina23')
User.create(email: 'rthomas@pillarsystems.com', password: 'ryan1234')




# coding: utf-8

#%w{
#  basic
#}.each do |part|
#  require File.expand_path(File.dirname(__FILE__))+"/seeds/#{part}.rb"
#end

levels=Level.create([
{name: 'Chapter'},
{name: 'Section'},
{name: 'Subsection'}
                    ])




s1=Section.create(name: 'Title', level_id: 1, ordernum: 1)
s2=Section.create(name: 'Acroymns', level_id: 1, ordernum: 2)
s3=Section.create(name: 'Introduction', level_id: 1, ordernum: 3)
s16=Section.create(name: 'Home Pages', level_id: 1, ordernum: 16)
s23=Section.create(name: 'Award Home Page', level_id: 1, ordernum: 23)
s25=Section.create(name: 'Award History', level_id: 1, ordernum: 25)
s30=Section.create(name: 'Project Planning: Results Monitoring Plan', level_id: 1, ordernum: 30)
s34=Section.create(name: 'Project Planning: Workplan', level_id: 1, ordernum: 34)
s39=Section.create(name: 'Quarterly Reporting', level_id: 1, ordernum: 39)
s50=Section.create(name: 'Quarterly Financial Report (QFR)', level_id: 1, ordernum: 50)
s51=Section.create(name: 'Documents', level_id: 1, ordernum: 51)
s55=Section.create(name: 'Payments', level_id: 1, ordernum: 55)
s59=Section.create(name: 'Site Visits', level_id: 1, ordernum: 59)
s61=Section.create(name: 'Award Closeout', level_id: 1, ordernum: 61)
s62=Section.create(name: 'ANNEX - Key Definitions', level_id: 1, ordernum: 62)
s4=Section.create(name: 'Features', level_id: 2, ordernum: 4)
s13=Section.create(name: 'Support', level_id: 2, ordernum: 13)
s14=Section.create(name: 'Accessing the ACPRS Database', level_id: 2, ordernum: 14)
s17=Section.create(name: 'Global Header', level_id: 2, ordernum: 17)
s21=Section.create(name: 'General Home Page', level_id: 2, ordernum: 21)
s24=Section.create(name: 'Award Info', level_id: 2, ordernum: 24)
s26=Section.create(name: 'Award Actions', level_id: 2, ordernum: 26)
s27=Section.create(name: 'Award Documents', level_id: 2, ordernum: 27)
s28=Section.create(name: 'CNs', level_id: 2, ordernum: 28)
s29=Section.create(name: 'Budgets', level_id: 2, ordernum: 29)
s31=Section.create(name: 'Entering Results Monitoring Plan Information', level_id: 2, ordernum: 31)
s32=Section.create(name: 'Key Elements in the Results Monitoring Plan', level_id: 2, ordernum: 32)
s33=Section.create(name: 'Printing the RMP', level_id: 2, ordernum: 33)
s35=Section.create(name: 'Entering Work Plan Information', level_id: 2, ordernum: 35)
s36=Section.create(name: 'Printing the Work Plan', level_id: 2, ordernum: 36)
s37=Section.create(name: 'Revision of Work Plan', level_id: 2, ordernum: 37)
s38=Section.create(name: 'Public Events', level_id: 2, ordernum: 38)
s40=Section.create(name: 'Quarterly Performance Report (QPR)', level_id: 2, ordernum: 40)
s41=Section.create(name: 'Entering Quarterly Report Information', level_id: 2, ordernum: 41)
s48=Section.create(name: 'Submitting QPRs', level_id: 2, ordernum: 48)
s49=Section.create(name: 'Approval/Rejection and Viewing the Quarterly Report after Submission', level_id: 2, ordernum: 49)
s52=Section.create(name: 'Document Groups', level_id: 2, ordernum: 52)
s53=Section.create(name: 'Document Types', level_id: 2, ordernum: 53)
s54=Section.create(name: 'Document Management', level_id: 2, ordernum: 54)
s56=Section.create(name: 'Compliance History', level_id: 2, ordernum: 56)
s57=Section.create(name: 'Obligation Balance', level_id: 2, ordernum: 57)
s58=Section.create(name: 'Add Payment', level_id: 2, ordernum: 58)
s60=Section.create(name: 'Site Visit Documents', level_id: 2, ordernum: 60)
s5=Section.create(name: 'Roles', level_id: 3, ordernum: 5)
s6=Section.create(name: 'Permissions', level_id: 3, ordernum: 6)
s7=Section.create(name: 'Awards and Projects', level_id: 3, ordernum: 7)
s8=Section.create(name: 'Award Actions and History', level_id: 3, ordernum: 8)
s9=Section.create(name: 'Results Management Plan (RMP)', level_id: 3, ordernum: 9)
s10=Section.create(name: 'The Statement of Work (SoW)', level_id: 3, ordernum: 10)
s11=Section.create(name: 'The Quarterly Report', level_id: 3, ordernum: 11)
s12=Section.create(name: 'The Implementer Portal', level_id: 3, ordernum: 12)
s15=Section.create(name: 'Troubleshooting Authentication', level_id: 3, ordernum: 15)
s18=Section.create(name: 'Login Status', level_id: 3, ordernum: 18)
s19=Section.create(name: 'Global Navigation Links', level_id: 3, ordernum: 19)
s20=Section.create(name: 'Global Search Bar', level_id: 3, ordernum: 20)
s22=Section.create(name: 'My Projects', level_id: 3, ordernum: 22)
s42=Section.create(name: 'Overall Assessment', level_id: 3, ordernum: 42)
s43=Section.create(name: 'Workplan Progress', level_id: 3, ordernum: 43)
s44=Section.create(name: 'Results Indicator Data', level_id: 3, ordernum: 44)
s45=Section.create(name: 'Narrative Sections', level_id: 3, ordernum: 45)
s46=Section.create(name: 'List of Appendices', level_id: 3, ordernum: 46)
s47=Section.create(name: 'Create QR PDF File', level_id: 3, ordernum: 47)