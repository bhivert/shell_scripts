#include "name.Class.hpp"

name::name(void) {
}

name::~name(void) {
}

std::ostream &	operator<<(std::ostream & o, name const & C) {
	(void)C;
	return (o);
}
