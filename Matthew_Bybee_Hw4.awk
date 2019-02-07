BEGIN {FS = ","}
{
	if (FNR>1 && substr($4, length($4)-3, length($4)) >= 1900){print $2}
}
