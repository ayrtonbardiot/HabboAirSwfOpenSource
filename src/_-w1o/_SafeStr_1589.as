// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-w1o._SafeStr_1589

package _-w1o
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1589 
    {

        private var _SafeStr_4028:int;
        private var _SafeStr_7693:int;
        private var _SafeStr_7694:Boolean;
        private var _SafeStr_7695:String;
        private var _SafeStr_7696:String;
        private var _description:String;
        private var _roomName:String;

        public function _SafeStr_1589(_arg_1:IMessageDataWrapper):void
        {
            _SafeStr_4028 = _arg_1.readInteger();
            _SafeStr_7693 = _arg_1.readInteger();
            _SafeStr_7694 = _arg_1.readBoolean();
            switch (_SafeStr_4028)
            {
                case 0:
                case 2:
                    _SafeStr_7695 = _arg_1.readString();
                    _SafeStr_7696 = _arg_1.readString();
                    return;
                case 3:
                    if (!isGuide)
                    {
                        _SafeStr_7695 = _arg_1.readString();
                        _SafeStr_7696 = _arg_1.readString();
                        _roomName = _arg_1.readString();
                    };
                    return;
                case 1:
                    _SafeStr_7695 = _arg_1.readString();
                    _SafeStr_7696 = _arg_1.readString();
                    _description = _arg_1.readString();
                    return;
                default:
                    return;
            };
        }

        public function get type():int
        {
            return (_SafeStr_4028);
        }

        public function get secondsAgo():int
        {
            return (_SafeStr_7693);
        }

        public function get isGuide():Boolean
        {
            return (_SafeStr_7694);
        }

        public function get otherPartyName():String
        {
            return (_SafeStr_7695);
        }

        public function get otherPartyFigure():String
        {
            return (_SafeStr_7696);
        }

        public function get description():String
        {
            return (_description);
        }

        public function get roomName():String
        {
            return (_roomName);
        }


    }
}//package _-w1o

// _SafeStr_1589 = "_-8d" (String#7136, DoABC#3)
// _SafeStr_4028 = "_-81R" (String#7081, DoABC#3)
// _SafeStr_7693 = "_-YW" (String#8871, DoABC#3)
// _SafeStr_7694 = "_-V1n" (String#8628, DoABC#3)
// _SafeStr_7695 = "_-S1R" (String#8409, DoABC#3)
// _SafeStr_7696 = "_-zS" (String#10693, DoABC#3)


