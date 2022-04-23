// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.poll.PollSession

package com.sulake.habbo.ui.widget.poll
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.window.utils._SafeStr_3114;
    import com.sulake.core.window.events._SafeStr_3116;

    public class PollSession implements _SafeStr_13 
    {

        private var _SafeStr_3820:int = -1;
        private var _SafeStr_5628:PollWidget;
        private var _SafeStr_5626:_SafeStr_3402;
        private var _SafeStr_5627:_SafeStr_3402;
        private var _endMessage:String = "";
        private var _disposed:Boolean = false;

        public function PollSession(_arg_1:int, _arg_2:PollWidget)
        {
            _SafeStr_3820 = _arg_1;
            _SafeStr_5628 = _arg_2;
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function dispose():void
        {
            if (_disposed)
            {
                return;
            };
            _disposed = true;
            if (_SafeStr_5626 != null)
            {
                _SafeStr_5626.dispose();
                _SafeStr_5626 = null;
            };
            if (_SafeStr_5627 != null)
            {
                _SafeStr_5627.dispose();
                _SafeStr_5627 = null;
            };
            _SafeStr_5628 = null;
            _disposed = true;
        }

        public function showOffer(_arg_1:String, _arg_2:String):void
        {
            hideOffer();
            _SafeStr_5626 = new PollOfferDialog(_SafeStr_3820, _arg_1, _arg_2, _SafeStr_5628);
            _SafeStr_5626.start();
        }

        public function hideOffer():void
        {
            if ((_SafeStr_5626 is PollOfferDialog))
            {
                if (!_SafeStr_5626.disposed)
                {
                    _SafeStr_5626.dispose();
                };
                _SafeStr_5626 = null;
            };
        }

        public function showContent(_arg_1:String, _arg_2:String, _arg_3:Array, _arg_4:Boolean):void
        {
            hideOffer();
            hideContent();
            _endMessage = _arg_2;
            _SafeStr_5627 = new PollContentDialog(_SafeStr_3820, _arg_1, _arg_3, _SafeStr_5628, _arg_4);
            _SafeStr_5627.start();
        }

        public function hideContent():void
        {
            if ((_SafeStr_5627 is PollContentDialog))
            {
                if (!_SafeStr_5627.disposed)
                {
                    _SafeStr_5627.dispose();
                };
                _SafeStr_5627 = null;
            };
        }

        public function showThanks():void
        {
            _SafeStr_5628.windowManager.alert("${poll_thanks_title}", _endMessage, 0, function (_arg_1:_SafeStr_3114, _arg_2:_SafeStr_3116):void
            {
                _arg_1.dispose();
            });
        }


    }
}//package com.sulake.habbo.ui.widget.poll

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_3114 = "_-b1E" (String#1258, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3402 = "_-11X" (String#10813, DoABC#4)
// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_5626 = "_-M1" (String#5587, DoABC#4)
// _SafeStr_5627 = "_-Cs" (String#5676, DoABC#4)
// _SafeStr_5628 = "_-Z1F" (String#9756, DoABC#4)


