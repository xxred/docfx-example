#
# ����һ����Ŀ�����������ݵĲ˵�
#

param($Directory)

# Ŀ¼�ļ�
$tocPath = $Directory + "/toc.md"

# Ŀ¼����
[Collections.Generic.List[string]] $tocContent

#��Ŀ¼����
[String[]] $newTocContent

# ��ȡĿ¼����
If (Test-Path $tocPath) {
    $tocContent = Get-Content -Path $tocPath -Encoding UTF8
}

# ����Ŀ¼
function buildToc($dirPath) {

    # �����жϵ�ǰĿ¼�Ƿ���md�ļ������ļ��У�û���򷵻�

    #If(Test-Path ($dirPath + "/index.md")){
    #	$tocContent = Get-Content -Encoding UTF8
    #}

	[String[]] $newTocContent

    # ��ȡ�ļ���Ϣ��-Recurse��ʾ������Ŀ¼
    $fileInfo = Get-ChildItem  $dirPath -Recurse -Include *.md -Exclude index.md,toc*.md

    # ��¼��һ�θ����ļ��е�����Ŀ $Directory ��·��
    $pPath = ""

    $fileInfo | foreach {
        # ���ӵ�ַ
        $linkName = $_.FullName.Replace($Directory, "").TrimStart("\\")

        # ��ȣ�������������ɲ㼶��ϵ
        $depth = $linkName.Split('\\').Length - 1

        # �ļ�����Ŀ�ļ��е�·��
        $linkPath = $linkName.Replace($_.Name, "").TrimEnd("\\")

        # �����ǰ·������һ�μ�¼��·����ͬ���������ɸ��� items
        If (!($linkPath -eq $pPath)) {

            #���ɸ�������
			$titleContent = $null
            $titleContent = buildItems($linkPath, $dirPath)
			$newTocContent = $newTocContent + $titleContent

            # ���¸���
            $pPath = $linkPath
        }

        $sharps = getSharp($depth)

        $newTocContent = $newTocContent + ($sharps + "[" + $_.BaseName + "](" + ($linkName -replace "\\","/") + ")")
    }

	# �����Ŀ¼����index.md�����һ��Ŀ¼
	if(Test-Path ([System.IO.Path]::Combine($dirPath, "index.md")))
	{
		$newTocContent = @("# [����](index.md)") + $newTocContent
	}

	return $newTocContent
}

# ���ɸ�������
function buildItems($arg) {

	$linkPath = $arg[0]
	$base = $arg[1]

    $arr = $linkPath -split "\\"
	$content = @()

    for ($i = 0; $i -lt $arr.Length; $i++) {

        $_ = $arr[$i]

        # ��ȡ���
        $sharps = getSharp($i)

		$title = $null

		$indexMDFile = [System.IO.Path]::Combine($base,  $_, "index.md")

		if(Test-Path $indexMDFile)
		{
			$title = $sharps + "[" + $_ + "](" + $_ + "/" + "index.md)"
		}else
		{
			$title = $sharps + $_
		}

		# ����Ѿ����ڴ˱��⣬����
		if(-not($newTocContent -contains $title))
		{
			# �������Ƕ������⣬���һ����
			if($sharps -eq "# ")
			{
				$content = $content + "" + $title
			}
			else
			{
				$content = $content + $title
			}		
		}		
    }

	return $content
}

# ������Ȼ�ȡ # ����
function getSharp($depth) {
	$depth++
    $share = ""
    for ($i = 0; $i -lt $depth; $i++) {
        $share += "#"
    }

	return $share + " "
}

$newToc = buildToc($Directory);

# ��������
$newToc | Out-File "utf8" -FilePath ([System.IO.Path]::Combine($Directory, "toc-temp.md"))

if(Test-Path ([System.IO.Path]::Combine($Directory, "toc.md"))
{
    $newToc | Out-File "utf8" -FilePath ([System.IO.Path]::Combine($Directory, "toc.md"))
}