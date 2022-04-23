// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.navigator.TextFieldManager

package com.sulake.habbo.navigator
{
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.ITextWindow;
    import flash.geom.Point;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window.events.WindowKeyboardEvent;

    public class TextFieldManager 
    {

        private var _navigator:_SafeStr_1697;
        private var _SafeStr_6142:ITextFieldWindow;
        private var _includeInfo:Boolean;
        private var _SafeStr_4787:String = "";
        private var _maxTextLen:int;
        private var _onEnter:Function;
        private var _SafeStr_6143:String = "";
        private var _errorPopup:_SafeStr_3133;
        private var _orgTextBackground:Boolean;
        private var _orgTextBackgroundColor:uint;

        public function TextFieldManager(_arg_1:_SafeStr_1697, _arg_2:ITextFieldWindow, _arg_3:int=1000, _arg_4:Function=null, _arg_5:String=null)
        {
            _navigator = _arg_1;
            _SafeStr_6142 = _arg_2;
            _maxTextLen = _arg_3;
            _arg_2.maxChars = _arg_3;
            _onEnter = _arg_4;
            if (_arg_5 != null)
            {
                _includeInfo = true;
                _SafeStr_4787 = _arg_5;
                _SafeStr_6142.text = _arg_5;
            };
            Util.setProcDirectly(_SafeStr_6142, onInputClick);
            _SafeStr_6142.addEventListener("WKE_KEY_DOWN", checkEnterPress);
            _SafeStr_6142.addEventListener("WE_CHANGE", checkMaxLen);
            this._orgTextBackground = _SafeStr_6142.textBackground;
            this._orgTextBackgroundColor = _SafeStr_6142.textBackgroundColor;
        }

        public function dispose():void
        {
            if (_SafeStr_6142)
            {
                _SafeStr_6142.dispose();
                _SafeStr_6142 = null;
            };
            if (_errorPopup)
            {
                _errorPopup.dispose();
                _errorPopup = null;
            };
            _navigator = null;
        }

        public function checkMandatory(_arg_1:String):Boolean
        {
            if (!isInputValid())
            {
                displayError(_arg_1);
                return (false);
            };
            restoreBackground();
            return (true);
        }

        public function restoreBackground():void
        {
            _SafeStr_6142.textBackground = this._orgTextBackground;
            _SafeStr_6142.textBackgroundColor = this._orgTextBackgroundColor;
        }

        public function displayError(_arg_1:String):void
        {
            _SafeStr_6142.textBackground = true;
            _SafeStr_6142.textBackgroundColor = 4294021019;
            if (this._errorPopup == null)
            {
                this._errorPopup = _SafeStr_3133(_navigator.getXmlWindow("nav_error_popup"));
                _navigator.refreshButton(this._errorPopup, "popup_arrow_down", true, null, 0);
                _SafeStr_3133(_SafeStr_6142.parent).addChild(this._errorPopup);
            };
            var _local_4:ITextWindow = ITextWindow(this._errorPopup.findChildByName("error_text"));
            _local_4.text = _arg_1;
            _local_4.width = (_local_4.textWidth + 5);
            _errorPopup.findChildByName("border").width = (_local_4.width + 15);
            _errorPopup.width = (_local_4.width + 15);
            var _local_2:Point = new Point();
            _SafeStr_6142.getLocalPosition(_local_2);
            this._errorPopup.x = _local_2.x;
            this._errorPopup.y = ((_local_2.y - this._errorPopup.height) + 3);
            var _local_3:_SafeStr_3109 = _errorPopup.findChildByName("popup_arrow_down");
            _local_3.x = ((this._errorPopup.width / 2) - (_local_3.width / 2));
            _errorPopup.x = (_errorPopup.x + ((_SafeStr_6142.width - _errorPopup.width) / 2));
            this._errorPopup.visible = true;
        }

        public function goBackToInitialState():void
        {
            clearErrors();
            if (_SafeStr_4787 != null)
            {
                _SafeStr_6142.text = _SafeStr_4787;
                _includeInfo = true;
            }
            else
            {
                _SafeStr_6142.text = "";
                _includeInfo = false;
            };
        }

        public function getText():String
        {
            if (_includeInfo)
            {
                return (_SafeStr_6143);
            };
            return (_SafeStr_6142.text);
        }

        public function setText(_arg_1:String):void
        {
            _includeInfo = false;
            _SafeStr_6142.text = _arg_1;
        }

        public function clearErrors():void
        {
            this.restoreBackground();
            if (this._errorPopup != null)
            {
                _errorPopup.visible = false;
            };
        }

        public function get input():ITextFieldWindow
        {
            return (_SafeStr_6142);
        }

        private function isInputValid():Boolean
        {
            return ((!(_includeInfo)) && (Util.trim(getText()).length > 2));
        }

        private function onInputClick(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WE_FOCUSED")
            {
                return;
            };
            if (!_includeInfo)
            {
                return;
            };
            _SafeStr_6142.text = _SafeStr_6143;
            _includeInfo = false;
            this.restoreBackground();
        }

        private function checkEnterPress(_arg_1:WindowKeyboardEvent):void
        {
            if (_arg_1.charCode == 13)
            {
                if (_onEnter != null)
                {
                    (_onEnter());
                };
            };
        }

        private function checkMaxLen(_arg_1:_SafeStr_3116):void
        {
            var _local_2:String = _SafeStr_6142.text;
            if (_local_2.length > _maxTextLen)
            {
                _SafeStr_6142.text = _local_2.substring(0, _maxTextLen);
            };
        }


    }
}//package com.sulake.habbo.navigator

// _SafeStr_1697 = "_-bu" (String#1958, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_4787 = "_-B1D" (String#4933, DoABC#4)
// _SafeStr_6142 = "_-DD" (String#2126, DoABC#4)
// _SafeStr_6143 = "_-hU" (String#24209, DoABC#4)


