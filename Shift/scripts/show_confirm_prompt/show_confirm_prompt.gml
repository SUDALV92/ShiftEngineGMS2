function show_confirm_prompt( questionStr, onConfirm )
{
	var prompt = instance_create_depth( 0, 0, 0, oConfirmPrompt );
	prompt.QuestionStr = questionStr;
	prompt.OnConfirm = onConfirm;
}
