unit ZipWriterExemplo;

interface

uses
  System.Zip,
  ThriftSerializer,
  br.gov.saude.esusab.dadotransp;

procedure gerarArquivoZip(dadoTransporte: IDadoTransporteThrift);

implementation

procedure gerarArquivoZip(dadoTransporte: IDadoTransporteThrift);
var
  zipFile: TZipFile;
  thriftSerializado: TArray<System.Byte>;

begin
  thriftSerializado := serializarThrift(dadoTransporte);
  zipFile := TZipFile.Create;
  try
    zipFile.Open('C:\temp\exemploConversaoThriftDelphi.zip', zmWrite);
    zipFile.Add(thriftSerializado, dadoTransporte.UuidDadoSerializado + '.esus', zcDeflate);
  finally
    zipFile.Free;
  end
end;

end.
