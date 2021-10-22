#include "name.h"

name::name(void) {
}

name::~name(void) {
}

std::ostream &	operator<<(std::ostream & o, const name & C) {
	(void)C;
	return (o);
}
