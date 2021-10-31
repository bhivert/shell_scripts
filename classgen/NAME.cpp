#include "name.hpp"

name::name(void) {
}

name::~name(void) {
}

std::string		name::to_string(void) const {
}

std::ostream &	operator<<(std::ostream & o, const name & C) {
	o << C.to_string();
	return (o);
}
