require 'rails_helper'

describe Jobs::CreateGithubLinkback do
  before do
    SiteSetting.github_linkback_enabled = true
  end

  it "shouldn't raise error if post not found" do
    post = Fabricate(:post)
    post.destroy!
    expect { Jobs::CreateGithubLinkback.new.execute(post_id: post.id) }.not_to raise_error
  end
end
