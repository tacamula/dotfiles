# upgrade libs and touch package.json
# https://medium.com/@the_teacher/yarn-upgrade-does-not-update-package-json-solution-9cd6122e6c6c
cat ./home/config/yarn/global/package.json | jq '.dependencies | keys | join(" ")' | xargs -I % yarn global upgrade % --latest
cat ./home/config/yarn/global/package.json | jq -r '.dependencies | keys | join("\n")' | xargs yarn global add
