// by nota

//com.sulake.habbo.help.HabboWayQuizController

package com.sulake.habbo.help
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.window.utils.IModalDialog;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.ISelectorListWindow;
    import com.sulake.core.window.components.ISelectableWindow;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window._SafeStr_3109;
    import _-d1i._SafeStr_764;
    import _-d1i._SafeStr_908;
    import _-51c._SafeStr_979;
    import com.sulake.habbo.communication.messages.parser.help._SafeStr_1160;
    import com.sulake.habbo.communication.messages.parser.help._SafeStr_1164;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.events._SafeStr_3116;
    import _-51c._SafeStr_273;

    public class HabboWayQuizController implements _SafeStr_13 
    {

        private static const HABBO_WAY_QUIZ_CODE:String = "HabboWay1";
        private static const SAFETY_QUIZ_CODE:String = "SafetyQuiz1";
        private static const PAGE_QUESTION:int = 1;
        private static const PAGE_SUCCESS:int = 2;
        private static const PAGE_FAILURE:int = 3;
        private static const PAGE_ANALYSIS:int = 4;

        private var _disposed:Boolean;
        private var _habboHelp:HabboHelp;
        private var _SafeStr_4003:IModalDialog;
        private var _window:_SafeStr_3133;
        private var _SafeStr_4506:_SafeStr_3133;
        private var _SafeStr_4507:ISelectorListWindow;
        private var _SafeStr_4504:ISelectableWindow;
        private var _SafeStr_4508:IItemListWindow;
        private var _SafeStr_4505:_SafeStr_3109;
        private var _SafeStr_4509:String;
        private var _SafeStr_4510:Array;
        private var _SafeStr_4511:Array;
        private var _answerOrders:Array;
        private var _questionIdsForWrongAnswers:Array;
        private var _currentQuestion:int;

        public function HabboWayQuizController(_arg_1:HabboHelp)
        {
            _habboHelp = _arg_1;
            _habboHelp.communicationManager.addHabboConnectionMessageEvent(new _SafeStr_764(onQuizData));
            _habboHelp.communicationManager.addHabboConnectionMessageEvent(new _SafeStr_908(onQuizResults));
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                _SafeStr_4506 = null;
                _SafeStr_4507 = null;
                if (_SafeStr_4504 != null)
                {
                    _SafeStr_4504.dispose();
                    _SafeStr_4504 = null;
                };
                _SafeStr_4508 = null;
                if (_SafeStr_4505 != null)
                {
                    _SafeStr_4505.dispose();
                    _SafeStr_4505 = null;
                };
                closeWindow();
                _disposed = true;
            };
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function showHabboWayQuiz():void
        {
            _habboHelp.sendMessage(new _SafeStr_979("HabboWay1"));
        }

        public function showSafetyQuiz():void
        {
            _habboHelp.sendMessage(new _SafeStr_979("SafetyQuiz1"));
        }

        private function onQuizData(_arg_1:_SafeStr_764):void
        {
            var _local_2:_SafeStr_1160 = _arg_1.getParser();
            _habboHelp.closeHabboWay();
            _habboHelp.closeSafetyBooklet();
            showWindow(_local_2.quizCode, _local_2.questionIds);
        }

        private function onQuizResults(_arg_1:_SafeStr_908):void
        {
            var _local_2:_SafeStr_1164 = _arg_1.getParser();
            _questionIdsForWrongAnswers = _local_2.questionIdsForWrongAnswers;
            if (_questionIdsForWrongAnswers.length == 0)
            {
                showPage(2);
            }
            else
            {
                showPage(3);
            };
        }

        private function showWindow(_arg_1:String, _arg_2:Array):void
        {
            closeWindow();
            _SafeStr_4003 = _habboHelp.getModalXmlWindow("habbo_way_quiz");
            _window = _SafeStr_3133(_SafeStr_4003.rootWindow);
            _window.procedure = onWindowEvent;
            _SafeStr_4506 = _SafeStr_3133(_window.findChildByName("question_pane"));
            _SafeStr_4507 = ISelectorListWindow(_SafeStr_4506.findChildByName("answer_list"));
            _SafeStr_4504 = _SafeStr_4507.getSelectableAt(0);
            _SafeStr_4507.removeSelectable(_SafeStr_4504);
            _SafeStr_4508 = IItemListWindow(_window.findChildByName("analysis_pane"));
            _SafeStr_4505 = _SafeStr_4508.getListItemAt(0);
            _SafeStr_4508.removeListItems();
            _SafeStr_4508.spacing = 4;
            _SafeStr_4509 = _arg_1;
            _SafeStr_4510 = _arg_2;
            _SafeStr_4511 = new Array(questionCount);
            _answerOrders = new Array(questionCount);
            setCurrentQuestion(0);
            var _local_3:_SafeStr_3133 = _SafeStr_3133(IItemListWindow(_SafeStr_4505).getListItemByName("explanation_container"));
            switch (_SafeStr_4509)
            {
                case "HabboWay1":
                    IStaticBitmapWrapperWindow(_window.findChildByName("question_illustration")).assetUri = "${image.library.url}habboway/quiz_question.png";
                    IStaticBitmapWrapperWindow(_window.findChildByName("indicator_image")).assetUri = "help_habboway_dove_on";
                    IStaticBitmapWrapperWindow(_window.findChildByName("success_illustration")).assetUri = "${image.library.url}habboway/quiz_success.png";
                    IStaticBitmapWrapperWindow(_local_3.findChildByName("explanation_illustration")).assetUri = "help_habboway_dove_quizz";
                    break;
                case "SafetyQuiz1":
                    IStaticBitmapWrapperWindow(_window.findChildByName("question_illustration")).assetUri = "${image.library.url}safetyquiz/question_illustration.png";
                    IStaticBitmapWrapperWindow(_window.findChildByName("indicator_image")).assetUri = "${image.library.url}safetyquiz/safety_on.png";
                    IStaticBitmapWrapperWindow(_window.findChildByName("failure_illustration")).assetUri = "${image.library.url}safetyquiz/result_failure.png";
                    IStaticBitmapWrapperWindow(_window.findChildByName("success_illustration")).assetUri = "${image.library.url}safetyquiz/result_success.png";
                    IStaticBitmapWrapperWindow(_local_3.findChildByName("explanation_illustration")).assetUri = "${image.library.url}safetyquiz/safety_on.png";
                    break;
                default:
            };
            showPage(1);
        }

        private function closeWindow():void
        {
            _window = null;
            if (_SafeStr_4003 != null)
            {
                _SafeStr_4003.dispose();
                _SafeStr_4003 = null;
            };
        }

        private function showPage(_arg_1:int):void
        {
            var _local_5:int;
            var _local_2:int;
            var _local_8:* = null;
            var _local_6:* = null;
            var _local_9:* = null;
            _window.findChildByName("question_pane").visible = (_arg_1 == 1);
            _window.findChildByName("success_pane").visible = (_arg_1 == 2);
            _window.findChildByName("failure_pane").visible = (_arg_1 == 3);
            _SafeStr_4508.visible = (_arg_1 == 4);
            _window.findChildByName("prev_next_buttons").visible = (_arg_1 == 1);
            _window.findChildByName("failure_buttons").visible = (_arg_1 == 3);
            _window.findChildByName("exit_button_container").visible = ((_arg_1 == 2) || (_arg_1 == 4));
            var _local_3:_SafeStr_3109 = _window.findChildByName("top_indicator");
            var _local_7:_SafeStr_3109 = _window.findChildByName("indicator_image");
            switch (_arg_1)
            {
                case 1:
                    _window.caption = getFullLocalizationKey("question.title");
                    _local_7.visible = true;
                    _local_3.visible = true;
                    _local_3.caption = _habboHelp.localization.getLocalizationWithParams(getRawLocalizationKey("question.page"), "", "current_page", 1, "page_count", questionCount.toString());
                    _local_3.caption = getFullLocalizationKey("question.page");
                    return;
                case 2:
                    _window.caption = getFullLocalizationKey("success.title");
                    _window.findChildByName("failure_advice").caption = getFullLocalizationKey("failure.advice");
                    _window.findChildByName("success_results").caption = _habboHelp.localization.getLocalizationWithParams(getRawLocalizationKey("success.results"), "", "question_count", questionCount.toString());
                    _local_7.visible = false;
                    _local_3.visible = false;
                    _local_3.caption = "";
                    return;
                case 3:
                    _local_5 = (_SafeStr_4510.length - _questionIdsForWrongAnswers.length);
                    _window.caption = getFullLocalizationKey("failure.title");
                    _window.findChildByName("failure_advice").caption = getFullLocalizationKey("failure.advice");
                    _window.findChildByName("failure_results").caption = _habboHelp.localization.getLocalizationWithParams(getRawLocalizationKey("failure.results"), "", "correct_count", _local_5.toString(), "total_count", questionCount.toString());
                    _local_7.visible = false;
                    _local_3.visible = false;
                    _local_3.caption = "";
                    return;
                case 4:
                    _window.caption = getFullLocalizationKey("analysis.title");
                    _local_7.visible = true;
                    _local_3.visible = true;
                    _local_3.caption = getFullLocalizationKey("analysis.top");
                    for each (var _local_4:int in _questionIdsForWrongAnswers)
                    {
                        _local_2 = _SafeStr_4511[_SafeStr_4510.indexOf(_local_4)];
                        _local_8 = IItemListWindow(_SafeStr_4505.clone());
                        _local_6 = (("${quiz." + _SafeStr_4509) + ".");
                        _local_9 = (((("." + _local_4) + ".") + _local_2) + "}");
                        _local_8.getListItemByName("question").caption = (((_local_6 + "question.") + _local_4) + "}");
                        _SafeStr_3133(_local_8.getListItemByName("answer_container")).findChildByName("answer").caption = ((_local_6 + "answer") + _local_9);
                        _SafeStr_3133(_local_8.getListItemByName("explanation_container")).findChildByName("explanation").caption = ((_local_6 + "explanation") + _local_9);
                        _SafeStr_4508.addListItem(_local_8);
                    };
                    IItemListWindow(_SafeStr_4508.getListItemAt((_SafeStr_4508.numListItems - 1))).getListItemByName("separator").dispose();
                default:
            };
        }

        private function onWindowEvent(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if ((((_disposed) || (_window == null)) || (!(_arg_1.type == "WME_CLICK"))))
            {
                return;
            };
            if ((_arg_2 is ISelectableWindow))
            {
                _SafeStr_4511[_currentQuestion] = _arg_2.name;
                _window.findChildByName("next_dimmer").visible = false;
            }
            else
            {
                switch (_arg_2.name)
                {
                    case "header_button_close":
                    case "exit_button":
                        closeWindow();
                        return;
                    case "prev_button":
                        setCurrentQuestion((_currentQuestion - 1));
                        return;
                    case "next_button":
                        setCurrentQuestion((_currentQuestion + 1));
                        return;
                    case "review_button":
                        showPage(4);
                        return;
                };
            };
        }

        private function setCurrentQuestion(_arg_1:int):void
        {
            var _local_3:int;
            var _local_10:* = null;
            var _local_2:int;
            var _local_4:* = null;
            var _local_6:* = null;
            var _local_7:int;
            var _local_5:* = null;
            var _local_9:* = null;
            if (_arg_1 >= questionCount)
            {
                _habboHelp.sendMessage(new _SafeStr_273(_SafeStr_4509, _SafeStr_4511));
            }
            else
            {
                if (_arg_1 >= 0)
                {
                    _currentQuestion = _arg_1;
                    _window.findChildByName("prev_dimmer").visible = (_arg_1 <= 0);
                    _window.findChildByName("next_dimmer").visible = (_SafeStr_4511[_currentQuestion] == null);
                    _window.findChildByName("top_indicator").caption = _habboHelp.localization.getLocalizationWithParams(getRawLocalizationKey("question.page"), "", "current_page", (_arg_1 + 1), "page_count", questionCount.toString());
                    while (_SafeStr_4507.numSelectables > 0)
                    {
                        _SafeStr_4507.removeSelectable(_SafeStr_4507.getSelectableAt(0)).dispose();
                    };
                    _local_3 = _SafeStr_4510[_currentQuestion];
                    _local_10 = [];
                    _SafeStr_4506.findChildByName("question").caption = (((("${quiz." + _SafeStr_4509) + ".question.") + _local_3) + "}");
                    _local_2 = 0;
                    while (true)
                    {
                        _local_4 = _habboHelp.localization.getLocalization(((((("quiz." + _SafeStr_4509) + ".answer.") + _local_3) + ".") + _local_2), "");
                        if (_local_4.length > 0)
                        {
                            _local_6 = ISelectableWindow(_SafeStr_4504.clone());
                            _local_6.caption = _local_4;
                            _local_6.name = _local_2.toString();
                            _local_10.push(_local_6);
                        }
                        else
                        {
                            break;
                        };
                        _local_2++;
                    };
                    if (_answerOrders[_currentQuestion] == null)
                    {
                        _answerOrders[_currentQuestion] = [];
                        _local_7 = 0;
                        while (_local_7 < _local_2)
                        {
                            _local_5 = _local_10.splice(int((Math.random() * _local_10.length)), 1)[0];
                            _SafeStr_4507.addSelectable(_local_5);
                            _answerOrders[_currentQuestion].push(_local_5.name);
                            _local_7++;
                        };
                    }
                    else
                    {
                        for each (var _local_8:int in _answerOrders[_currentQuestion])
                        {
                            _SafeStr_4507.addSelectable(_local_10[_local_8]);
                        };
                    };
                    _local_9 = _SafeStr_4507.getSelectableByName(_SafeStr_4511[_currentQuestion]);
                    if (_local_9 != null)
                    {
                        _local_9.select();
                    };
                };
            };
        }

        private function get questionCount():int
        {
            return ((_SafeStr_4510 != null) ? _SafeStr_4510.length : 0);
        }

        private function getFullLocalizationKey(_arg_1:String):String
        {
            return (("${" + getRawLocalizationKey(_arg_1)) + "}");
        }

        private function getRawLocalizationKey(_arg_1:String):String
        {
            switch (_SafeStr_4509)
            {
                case "HabboWay1":
                    return ("habbo.way.quiz." + _arg_1);
                default:
                    return ((("quiz." + _SafeStr_4509) + ".") + _arg_1);
            };
        }


    }
}//package com.sulake.habbo.help

// _SafeStr_1160 = "_-Y1d" (String#35367, DoABC#4)
// _SafeStr_1164 = "_-S1q" (String#40713, DoABC#4)
// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_273 = "_-z16" (String#29815, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_4003 = "_-Qd" (String#802, DoABC#4)
// _SafeStr_4504 = "_-Z9" (String#7991, DoABC#4)
// _SafeStr_4505 = "_-f1b" (String#7972, DoABC#4)
// _SafeStr_4506 = "_-fB" (String#11106, DoABC#4)
// _SafeStr_4507 = "_-U1x" (String#5575, DoABC#4)
// _SafeStr_4508 = "_-L6" (String#6421, DoABC#4)
// _SafeStr_4509 = "_-Fv" (String#7163, DoABC#4)
// _SafeStr_4510 = "_-U19" (String#9524, DoABC#4)
// _SafeStr_4511 = "_-pb" (String#9834, DoABC#4)
// _SafeStr_764 = "_-H1F" (String#25960, DoABC#4)
// _SafeStr_908 = "_-J12" (String#25470, DoABC#4)
// _SafeStr_979 = "_-F1H" (String#18674, DoABC#4)


