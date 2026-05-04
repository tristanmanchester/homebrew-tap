class Sifs < Formula
  desc "SIFS Is Fast Search: instant local code search for agents"
  homepage "https://github.com/tristanmanchester/sifs"
  url "https://github.com/tristanmanchester/sifs/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "796adf12c0c187f26627acc153a4238ccb10146768131aff6c1b97c3dd034b9c"
  license "MIT"
  head "https://github.com/tristanmanchester/sifs.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--path", ".", "--root", prefix
  end

  test do
    repo = testpath/"tiny-repo"
    repo.mkpath
    (repo/"auth.py").write <<~PY
      def authenticate_token(token):
          return token == "secret"
    PY

    system "git", "-C", repo, "init", "--quiet"

    output = shell_output("#{bin}/sifs search authenticate_token #{repo} --mode bm25 --offline --no-cache")
    assert_match "auth.py", output
    assert_match "authenticate_token", output
  end
end
