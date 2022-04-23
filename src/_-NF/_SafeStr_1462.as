// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-NF._SafeStr_1462

package _-NF
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1462 implements IMessageParser 
    {

        private var _SafeStr_4128:int = 0;
        private var _SafeStr_7347:int = 0;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_4128 = _arg_1.readInteger();
            _SafeStr_7347 = _arg_1.readInteger();
            return (true);
        }

        public function get userId():int
        {
            return (_SafeStr_4128);
        }

        public function get respectTotal():int
        {
            return (_SafeStr_7347);
        }


    }
}//package _-NF

// _SafeStr_1462 = "_-43" (String#6841, DoABC#3)
// _SafeStr_4128 = "_-q1y" (String#10067, DoABC#3)
// _SafeStr_7347 = "_-z1" (String#10652, DoABC#3)


