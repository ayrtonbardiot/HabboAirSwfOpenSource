// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-a1N._SafeStr_1610

package _-a1N
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1610 
    {

        private var _SafeStr_5716:int;
        private var _figureString:String;
        private var _SafeStr_3834:String;

        public function _SafeStr_1610(_arg_1:IMessageDataWrapper)
        {
            _SafeStr_5716 = _arg_1.readInteger();
            _figureString = _arg_1.readString();
            _SafeStr_3834 = _arg_1.readString();
        }

        public function get slotId():int
        {
            return (_SafeStr_5716);
        }

        public function get figureString():String
        {
            return (_figureString);
        }

        public function get gender():String
        {
            return (_SafeStr_3834);
        }


    }
}//package _-a1N

// _SafeStr_1610 = "_-jW" (String#9638, DoABC#3)
// _SafeStr_3834 = "_-tK" (String#10279, DoABC#3)
// _SafeStr_5716 = "_-k1L" (String#9672, DoABC#3)


