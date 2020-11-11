pr_link_base = "https://github.com/rails/rails/pull/"

out = ""

File.foreach("draft.md").each do |line|
  if line =~ /#/
    parts = line.split("#")
    pr_num = parts[-1].chomp.strip
    new_line = (parts - [parts[-1]]).join + pr_link_base + pr_num
    out << new_line + "\n"
  else
    out << line
  end
end

File.open("outfile.md", "w") { |f| f.write(out) }
