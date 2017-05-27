class Parallel < Formula
  desc "GNU parallel shell command"
  homepage "https://savannah.gnu.org/projects/parallel/"
  url "https://ftp.gnu.org/gnu/parallel/parallel-20170522.tar.bz2"
  mirror "https://ftpmirror.gnu.org/parallel/parallel-20170522.tar.bz2"
  sha256 "8a0d51632921b80102817151b62ea17eed6b28d088c40d94ed4ee40618a3bccc"
  head "https://git.savannah.gnu.org/git/parallel.git"

  conflicts_with "moreutils", :because => "both install a 'parallel' executable."

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    assert_equal "test\ntest\n",
                 shell_output("#{bin}/parallel --will-cite echo ::: test test")
  end
end
