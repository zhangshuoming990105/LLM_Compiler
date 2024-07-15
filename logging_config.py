import logging

def configure_logging(log_file):
    logging.basicConfig(filename=log_file, level=logging.INFO)
    logging.info("log file created!")
    
def log_failed(
    failed_id,
    failed_c,
    failed_asm,
    failed_asm_ref,
    case_id,
    c_code,
    x86_llm_code,
    x86_code,
):
    failed_id.append(case_id)
    failed_c.append(c_code)
    failed_asm.append(x86_llm_code)
    failed_asm_ref.append(x86_code)