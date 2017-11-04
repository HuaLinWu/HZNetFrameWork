git add -u && git commit -m "add tag $1" && git push
git push origin --delete tag $1
git tag -d $1
git tag -m "$1" $1
git push --tags
