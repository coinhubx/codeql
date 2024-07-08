void write_default_config_bad() {
	// BAD - this is world-writable so any user can overwrite the config
	int out = creat(OUTFILE, 0666);
	dprintf(out, DEFAULT_CONFIG);
}

void write_default_config_good() {
	// GOOD - this allows only the current user to modify the file
	int out = creat(OUTFILE, S_IWUSR | S_IRUSR);
	dprintf(out, DEFAULT_CONFIG);
}

void write_default_config_good_2() {
	// GOOD - this allows only the current user to modify the file
	int out = open(OUTFILE, O_WRONLY | O_CREAT, S_IWUSR | S_IRUSR);
	FILE *fd = fdopen(out, "w");
	fprintf(fd, DEFAULT_CONFIG);
}
