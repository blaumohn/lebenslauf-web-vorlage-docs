def _walk_text:
  if type == "array" then
    map(_walk_text) | join("")
  elif type == "object" then
    if (.type? == "paragraph") then
      ((.content? // []) | map(_walk_text) | join("")) + "\n\n"
    elif (.type? == "heading") then
      ((.content? // []) | map(_walk_text) | join("")) + "\n\n"
    elif (.type? == "hardBreak") then
      "\n"
    elif (has("text")) then
      .text
    elif (has("content")) then
      (.content | map(_walk_text) | join(""))
    else
      ""
    end
  else
    ""
  end;

def adf_to_text:
  _walk_text
  | gsub("\r\n"; "\n")
  | gsub("\n{3,}"; "\n\n")
  | gsub("[ \t]+\n"; "\n")
  | gsub("[ \t]{2,}"; " ")
  | gsub("^\n+"; "")
  | gsub("\n+$"; "");

adf_to_text
