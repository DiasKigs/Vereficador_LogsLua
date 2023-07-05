-- Função para obter a data e hora atual
function getDateTime()
    local dateTime = os.date("%Y-%m-%d %H:%M:%S")
    return dateTime
 end
 
 -- Função para verificar se o processo está em execução
 function isProcessRunning(processName)
    local processCommand = "tasklist /FI \"IMAGENAME eq " .. processName .. "\" /NH"
    local processOutput = io.popen(processCommand)
    local outputLines = processOutput:read("*a")
    processOutput:close()
    return string.find(outputLines, processName) ~= nil
 end
 
 -- Nome do arquivo de log
 local nomeArquivoLog = "processos_log.log"
 
 -- Cria o arquivo de log ou abre em modo de adição (append)
 local arquivoLog = io.open(nomeArquivoLog, "a+")
 
 -- Verifica se o arquivo foi aberto corretamente
 if arquivoLog then
    -- Obtém a data e hora atual
    local dataHora = getDateTime()
 
    -- Escreve a data e hora no arquivo de log
    arquivoLog:write("Data e Hora: " .. dataHora .. "\n")
    arquivoLog:write("----------------------------------------------\n")
 
    -- Verifica se o processo Discord.exe está em execução
    local processoDiscord = "Discord.exe"
    if isProcessRunning(processoDiscord) then
       -- Escreve o processo Discord.exe no arquivo de log
       arquivoLog:write("O processo " .. processoDiscord .. " está em execução.\n")
    end
 
    -- Fecha o arquivo de log
    arquivoLog:close()
 
    -- Exibe uma mensagem informando que os processos foram registrados com sucesso
    print("Os processos foram registrados no arquivo de log: " .. nomeArquivoLog)
 else
    -- Exibe uma mensagem de erro se não for possível abrir o arquivo de log
    print("Erro ao abrir o arquivo de log: " .. nomeArquivoLog)
 end
 
