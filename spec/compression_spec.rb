describe Kafka::Compression do
  Kafka::Compression.codecs.each do |codec_name|
    describe codec_name.to_s do
      it "encodes and decodes data" do
        data = "yolo"
        codec = Kafka::Compression.find_codec(codec_name)

        expect(codec.decompress(codec.compress(data))).to eq data
      end
    end
  end
end
