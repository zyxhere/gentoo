# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33 ruby34"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="CHANGELOG README"

RUBY_FAKEGEM_EXTENSIONS=(ext/levenshtein/extconf.rb)

inherit ruby-fakegem

DESCRIPTION="Levenshtein distance algorithm"
HOMEPAGE="https://github.com/mbleigh/mash"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ppc ~ppc64 ~sparc ~x86"

each_ruby_test() {
	${RUBY} -Ilib test/test.rb || die
}
