// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.wordquiz.WordQuizView

package com.sulake.habbo.ui.widget.wordquiz
{
    import com.sulake.core.window._SafeStr_3133;
    import flash.utils.Timer;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components.ILabelWindow;
    import com.sulake.core.utils._SafeStr_24;
    import flash.events.TimerEvent;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events._SafeStr_3116;

    public class WordQuizView 
    {

        public static const STATE_QUESTION:int = 0;
        public static const STATE_RESULT:int = 1;
        private static const CONTAINER_IN_BOTTOM:Boolean = false;

        private static var _displayResultDuration:int;

        private var _SafeStr_4981:WordQuizWidget;
        private var _window:_SafeStr_3133;
        private var _SafeStr_6160:Timer;
        private var _SafeStr_6291:String;

        public function WordQuizView(_arg_1:WordQuizWidget)
        {
            _SafeStr_4981 = _arg_1;
            _displayResultDuration = (_SafeStr_4981.handler.container.config.getInteger("poll.word.quiz.result.view.seconds", 4) * 1000);
        }

        public function dispose():void
        {
            _SafeStr_4981 = null;
            removeWindow();
            if (_window)
            {
                if (_window.desktop)
                {
                    _window.desktop.removeEventListener("WE_RESIZED", onDesktopResized);
                };
                _window.dispose();
                _window = null;
            };
        }

        private function getCorrectTextWidth(_arg_1:int, _arg_2:String=null):int
        {
            var _local_4:* = null;
            var _local_5:* = null;
            if (_arg_1 == 0)
            {
                _local_4 = "wordquiz_question_xml";
            }
            else
            {
                _local_4 = "wordquiz_result_xml";
            };
            _local_5 = (_SafeStr_4981.windowManager.buildFromXML((_SafeStr_4981.assets.getAssetByName(_local_4).content as XML)) as _SafeStr_3133);
            if (_local_5 == null)
            {
                throw (new Error("Failed to construct window from XML!"));
            };
            _local_5.findChildByName("quiz_topic").caption = _arg_2;
            _local_5.findChildByName("quiz_topic").width = 660;
            var _local_3:int = ITextWindow(_local_5.findChildByName("quiz_topic")).textWidth;
            _local_5.dispose();
            return (_local_3);
        }

        public function createWindow(_arg_1:int, _arg_2:String=null):void
        {
            var _local_3:* = null;
            removeWindow();
            if (_arg_1 == 0)
            {
                _local_3 = "wordquiz_question_xml";
            }
            else
            {
                _local_3 = "wordquiz_result_xml";
            };
            _window = (_SafeStr_4981.windowManager.buildFromXML((_SafeStr_4981.assets.getAssetByName(_local_3).content as XML)) as _SafeStr_3133);
            if (_window == null)
            {
                throw (new Error("Failed to construct window from XML!"));
            };
            var _local_4:_SafeStr_3109 = _window.findChildByName("button_like");
            if (_local_4)
            {
                _local_4.addEventListener("WME_CLICK", onLike);
            };
            _local_4 = _window.findChildByName("button_dislike");
            if (_local_4)
            {
                _local_4.addEventListener("WME_CLICK", onDislike);
            };
            if (_arg_2 != null)
            {
                _SafeStr_6291 = _arg_2;
            };
            _window.findChildByName("quiz_topic").caption = _SafeStr_6291;
            _window.findChildByName("quiz_topic").width = Math.min(660, (getCorrectTextWidth(_arg_1, _SafeStr_6291) + 6));
            _window.findChildByName("quiz_topic").y = 3;
            positionWindow();
            _window.desktop.addEventListener("WE_RESIZED", onDesktopResized);
        }

        public function removeWindow():void
        {
            if (((!(_window)) || (_window.numChildren == 0)))
            {
                return;
            };
            _window.desktop.addEventListener("WE_RESIZED", onDesktopResized);
            _window.dispose();
            _window = null;
            if (_SafeStr_6160)
            {
                _SafeStr_6160.reset();
                _SafeStr_6160 = null;
            };
        }

        public function get mainWindow():_SafeStr_3109
        {
            return (_window);
        }

        public function updateCounter(_arg_1:String):void
        {
            if (((!(_window)) || (!(_window.findChildByName("countdown")))))
            {
                return;
            };
            if (_arg_1 == "0")
            {
                _arg_1 = "";
            };
            _window.findChildByName("countdown").caption = _arg_1;
        }

        public function updateResults(_arg_1:_SafeStr_24):void
        {
            if (((!(_window)) || (!(_arg_1))))
            {
                return;
            };
            var _local_3:int = ((_arg_1["0"] != null) ? _arg_1.getValue("0") : 0);
            var _local_2:ILabelWindow = (_window.findChildByName("lbl_dislike_count") as ILabelWindow);
            if (_local_2)
            {
                _local_2.text = _local_3.toString();
            };
            _local_3 = ((_arg_1["1"] != null) ? _arg_1.getValue("1") : 0);
            _local_2 = (_window.findChildByName("lbl_like_count") as ILabelWindow);
            if (_local_2)
            {
                _local_2.text = _local_3.toString();
            };
        }

        public function displayResults(_arg_1:_SafeStr_24):void
        {
            createWindow(1);
            updateResults(_arg_1);
            _SafeStr_6160 = new Timer(_displayResultDuration);
            _SafeStr_6160.addEventListener("timer", onWaitTimer);
            _SafeStr_6160.start();
        }

        private function onWaitTimer(_arg_1:TimerEvent):void
        {
            removeWindow();
        }

        private function onLike(_arg_1:WindowMouseEvent):void
        {
            _SafeStr_4981.sendAnswer(1);
        }

        private function onDislike(_arg_1:WindowMouseEvent):void
        {
            _SafeStr_4981.sendAnswer(0);
        }

        private function onDesktopResized(_arg_1:_SafeStr_3116):void
        {
            positionWindow();
        }

        private function positionWindow():void
        {
            if (((!(_window)) || (_window.numChildren == 0)))
            {
                return;
            };
            var _local_1:_SafeStr_3109 = _window.getChildAt(0);
            _window.x = ((_window.desktop.width / 2) - (_local_1.width / 2));
            _window.y = 6;
        }


    }
}//package com.sulake.habbo.ui.widget.wordquiz

// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_6160 = "_-01Q" (String#3564, DoABC#4)
// _SafeStr_6291 = "_-46" (String#15230, DoABC#4)


