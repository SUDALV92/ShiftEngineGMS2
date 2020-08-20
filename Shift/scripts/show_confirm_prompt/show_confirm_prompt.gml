/// @description  show_confirm_prompt( questionStr, onConfirmScript )
/// @param  questionStr
/// @param  onConfirmScript 
function show_confirm_prompt(argument0, argument1) {
	var questionStr = argument0;
	var onConfirm = argument1;

	var prompt = instance_create_depth( 0, 0, 0, oConfirmPrompt );
	prompt.QuestionStr = questionStr;
	prompt.OnConfirm = onConfirm;



}
