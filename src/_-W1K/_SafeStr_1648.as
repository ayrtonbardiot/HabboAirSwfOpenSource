// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-W1K._SafeStr_1648

package _-W1K
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1648 
    {

        private var _SafeStr_7686:int;
        private var _SafeStr_7663:int;
        private var _SafeStr_7687:int;
        private var _SafeStr_7688:String;
        private var _SafeStr_7689:String;

        public function _SafeStr_1648(_arg_1:IMessageDataWrapper)
        {
            _SafeStr_7686 = _arg_1.readInteger();
            _SafeStr_7663 = _arg_1.readInteger();
            _SafeStr_7687 = _arg_1.readInteger();
            _SafeStr_7688 = _arg_1.readString();
            _SafeStr_7689 = _arg_1.readString();
        }

        public function get relationshipStatusType():int
        {
            return (_SafeStr_7686);
        }

        public function get friendCount():int
        {
            return (_SafeStr_7663);
        }

        public function get randomFriendId():int
        {
            return (_SafeStr_7687);
        }

        public function get randomFriendName():String
        {
            return (_SafeStr_7688);
        }

        public function get randomFriendFigure():String
        {
            return (_SafeStr_7689);
        }


    }
}//package _-W1K

// _SafeStr_1648 = "_-Ne" (String#8104, DoABC#3)
// _SafeStr_7663 = "_-M" (String#7990, DoABC#3)
// _SafeStr_7686 = "_-V1T" (String#8617, DoABC#3)
// _SafeStr_7687 = "_-01O" (String#6478, DoABC#3)
// _SafeStr_7688 = "_-V1u" (String#8632, DoABC#3)
// _SafeStr_7689 = "_-oA" (String#9946, DoABC#3)


