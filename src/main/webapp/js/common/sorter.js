function sortDate(a, b) {
	a = a.split('/');
	b = b.split('/');
	if (a[2] == b[2]) {
		if (a[0] == b[0]) {
			return (a[1] > b[1] ? 1 : -1);
		} else {
			return (a[0] > b[0] ? 1 : -1);
		}
	} else {
		return (a[2] > b[2] ? 1 : -1);
	}
}

// 数字
function sortInt(a, b) {
	if (a.length > b.length)
		return 1;
	else if (a.length < b.length)
		return -1;
	else if (a > b)
		return 1;
	else
		return -1;
}
// 浮点型
function sortFloat(a, b) {
	var number1 = parseFloat(a);
	var number2 = parseFloat(b);
	return (number1 > number2 ? 1 : -1);
}