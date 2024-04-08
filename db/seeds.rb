# ユーザーデータの追加
users = User.create([
  {  user_name: "Alice", user_icon: "alice_icon.png" },
  {  user_name: "Bob", user_icon: "bob_icon.png" }
])

# グループデータの追加
groups = Group.create([
  {  group_name: "Group A", user_id: users.first.id },
  { group_name: "Group B", user_id: users.last.id }
])

# イシューデータの追加
issues = Issue.create([
  {  title: "Issue 1", contents: "Contents of issue 1", day_fragment: true, group_id: groups.first.id },
  { title: "Issue 2", contents: "Contents of issue 2", day_fragment: false, group_id: groups.last.id }
])

# タグデータの追加
tags = Tag.create([
  {  tag_count: 5, issue_id: issues.first.id },
  {  tag_count: 3, issue_id: issues.last.id }
])
