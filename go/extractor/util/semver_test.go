package util

import "testing"

func TestNewSemVer(t *testing.T) {
	type TestPair struct {
		Input    string
		Expected string
	}

	// Check the special case for the empty string.
	result := NewSemVer("")
	if result != nil {
		t.Errorf("Expected NewSemVer(\"\") to return nil, but got \"%s\".", result)
	}

	testData := []TestPair{
		{"0", "v0.0.0"},
		{"1.0", "v1.0.0"},
		{"1.0.2", "v1.0.2"},
		{"1.20", "v1.20.0"},
		{"1.22.3", "v1.22.3"},
	}

	// prefixes should not affect the result
	prefixes := []string{"", "go", "v"}
	// suffixes
	suffixes := []string{"", "rc1", "-rc1"}

	// Check that we get what we expect for each of the test cases.
	for _, pair := range testData {
		for _, prefix := range prefixes {
			for _, suffix := range suffixes {
				// c
				input := prefix + pair.Input + suffix
				result := NewSemVer(input)

				expected := pair.Expected
				if suffix != "" {
					expected += "-rc1"
				}

				if result.String() != expected {
					t.Errorf(
						"Expected NewSemVer(\"%s\") to return \"%s\", but got \"%s\".",
						input,
						expected,
						result,
					)
				}
			}
		}
	}
}
