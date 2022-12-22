echo ""
echo "################################################################################"
echo "Find File with SUID Set:"
find $HOME -perm /4000

echo ""
echo "################################################################################"
echo "Find File with SGID Set:"
find $HOME -perm /2000

echo ""
echo "################################################################################"
echo "Find File with SUID & SGID Set:"
find $HOME -perm -6000
