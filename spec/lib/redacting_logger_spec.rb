require "logger"
require_relative "../spec_helper"
require_relative "../../lib/redacting_logger"

describe RedactingLogger do
  context "#initialize" do
    it "ensures the class is initialized properly" do
      redact_patterns = ["secret", "password"]
      level = Logger::INFO
      logger = RedactingLogger.new(redact_patterns: redact_patterns, log_device: STDOUT, level: level)

      expect(logger.level).to eq(level)
      expect(logger.instance_variable_get(:@redact_patterns)).to eq(redact_patterns)
    end
  end
end
