function percentFormatter(value, row, index) {
	if (isNaN(value)) {
		value = 0;
	}
	value = value * 100;
	value = value.toFixed(2);
	value = value + "%";
	return value;
}
