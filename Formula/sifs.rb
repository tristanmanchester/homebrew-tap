class Sifs < Formula
  desc "Instant local code search for agents"
  homepage "https://github.com/tristanmanchester/sifs"
  url "https://github.com/tristanmanchester/sifs/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "c982eca9c66677604ea61769dd5effb6c78bd6e69a8c1bf9d3b215a6380f2eab"
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

    output = shell_output("#{bin}/sifs search authenticate_token --source #{repo} --mode bm25 --offline --no-cache")
    assert_match "auth.py", output
    assert_match "authenticate_token", output
  end
end
