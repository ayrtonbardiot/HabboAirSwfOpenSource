// by nota

//com.sulake.habbo.help.SafetyBookletController

package com.sulake.habbo.help
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.window.utils.IModalDialog;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.habbo.window.widgets._SafeStr_3275;
    import com.sulake.core.window.components._SafeStr_3199;

    public class SafetyBookletController implements _SafeStr_13 
    {

        private const START_PAGE:int = 0;
        private const FINAL_PAGE:int = 7;

        private var _habboHelp:HabboHelp;
        private var _SafeStr_4003:IModalDialog;
        private var _window:_SafeStr_3133;
        private var _disposed:Boolean = false;
        private var _SafeStr_4780:int = 0;

        public function SafetyBookletController(_arg_1:HabboHelp)
        {
            _habboHelp = _arg_1;
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                closeWindow();
                if (_habboHelp)
                {
                    _habboHelp = null;
                };
                _disposed = true;
            };
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function openSafetyBooklet():void
        {
            closeWindow();
            _SafeStr_4003 = _habboHelp.getModalXmlWindow("safety_booklet");
            _window = _SafeStr_3133(_SafeStr_4003.rootWindow);
            _window.procedure = onWindowEvent;
            setCurrentPage(0);
            _habboHelp.tracking.trackEventLog("Quiz", "", "talent.quiz.open");
        }

        public function closeWindow():void
        {
            _window = null;
            if (_SafeStr_4003)
            {
                _SafeStr_4003.dispose();
                _SafeStr_4003 = null;
            };
        }

        private function onWindowEvent(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if ((((_disposed) || (!(_window))) || (!(_arg_1.type == "WME_CLICK"))))
            {
                return;
            };
            switch (_arg_2.name)
            {
                case "header_button_close":
                    closeWindow();
                    return;
                case "next_button":
                    setCurrentPage(Math.min(7, (_SafeStr_4780 + 1)));
                    _habboHelp.tracking.trackEventLog("Quiz", ("" + _SafeStr_4780), "talent.quiz.change_page");
                    _habboHelp.trackGoogle("safetyBooklet", ("clickNextPage_" + _SafeStr_4780));
                    return;
                case "back_button":
                case "previous_button":
                    setCurrentPage(Math.max(0, (_SafeStr_4780 - 1)));
                    _habboHelp.tracking.trackEventLog("Quiz", ("" + _SafeStr_4780), "talent.quiz.change_page");
                    _habboHelp.trackGoogle("safetyBooklet", ("clickPrevPage_" + _SafeStr_4780));
                    return;
                case "quiz_button":
                    _habboHelp.trackGoogle("safetyBooklet", "clickQuiz");
                    _habboHelp.showSafetyQuiz();
                    return;
                case "ok_button":
                    _habboHelp.trackGoogle("safetyBooklet", "clickOk");
                    _habboHelp.showSafetyQuiz();
                    _habboHelp.closeSafetyBooklet();
                    return;
            };
        }

        private function setCurrentPage(_arg_1:int):void
        {
            _SafeStr_4780 = _arg_1;
            _window.findChildByName("safety.quiz.explanation").visible = (!(_habboHelp.safetyQuizDisabled));
            if (_SafeStr_4780 < 7)
            {
                if (_SafeStr_4780 == 0)
                {
                    _window.findChildByName("previous_button").visible = false;
                }
                else
                {
                    _window.findChildByName("previous_button").visible = true;
                };
                IStaticBitmapWrapperWindow(_window.findChildByName("illustration")).assetUri = (("${image.library.url}safetyquiz/page_" + _SafeStr_4780) + ".png");
                IStaticBitmapWrapperWindow(_window.findChildByName("safety_image")).assetUri = "${image.library.url}safetyquiz/safety_off.png";
                _SafeStr_3275(_SafeStr_3199(_window.findChildByName("page_widget")).widget).position = (_SafeStr_4780 + 1);
                _window.findChildByName("title").caption = (("${safety.booklet.page." + _SafeStr_4780) + ".title}");
                _window.findChildByName("description").caption = (("${safety.booklet.page." + _SafeStr_4780) + ".description}");
                _window.findChildByName("page_container").visible = true;
                _window.findChildByName("final_page").visible = false;
                _window.findChildByName("final_page_no_questions").visible = false;
                _window.findChildByName("page_container").invalidate();
            }
            else
            {
                IStaticBitmapWrapperWindow(_window.findChildByName("illustration")).assetUri = "${image.library.url}safetyquiz/page_end.png";
                IStaticBitmapWrapperWindow(_window.findChildByName("safety_image")).assetUri = "${image.library.url}safetyquiz/safety_on.png";
                _SafeStr_3275(_SafeStr_3199(_window.findChildByName("page_widget")).widget).position = 0;
                _window.findChildByName("page_container").visible = false;
                if (_habboHelp.safetyQuizDisabled)
                {
                    _window.findChildByName("final_page_no_questions").visible = true;
                    _window.findChildByName("final_page_no_questions").invalidate();
                }
                else
                {
                    _window.findChildByName("final_page").visible = true;
                    _window.findChildByName("final_page").invalidate();
                };
            };
        }


    }
}//package com.sulake.habbo.help

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3275 = "_-2J" (String#8317, DoABC#4)
// _SafeStr_4003 = "_-Qd" (String#802, DoABC#4)
// _SafeStr_4780 = "_-fK" (String#917, DoABC#4)


