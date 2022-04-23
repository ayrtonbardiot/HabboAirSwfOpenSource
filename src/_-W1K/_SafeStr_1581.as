// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-W1K._SafeStr_1581

package _-W1K
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1581 
    {

        private var _SafeStr_3820:int;
        private var _color:uint;

        public function _SafeStr_1581(_arg_1:IMessageDataWrapper)
        {
            _SafeStr_3820 = _arg_1.readInteger();
            _color = parseInt(_arg_1.readString(), 16);
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get color():uint
        {
            return (_color);
        }

        public function get red():int
        {
            return ((_color >> 16) & 0xFF);
        }

        public function get green():int
        {
            return ((_color >> 8) & 0xFF);
        }

        public function get blue():int
        {
            return ((_color >> 0) & 0xFF);
        }


    }
}//package _-W1K

// _SafeStr_1581 = "_-A1O" (String#7221, DoABC#3)
// _SafeStr_3820 = "_-t1q" (String#10263, DoABC#3)


