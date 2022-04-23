// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-PB._SafeStr_1226

package _-PB
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-Zz._SafeStr_1552;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1226 implements IMessageParser 
    {

        private var _SafeStr_5536:int;
        private var _SafeStr_5431:int;
        private var _SafeStr_4851:_SafeStr_1552;
        private var _SafeStr_6424:Boolean;
        private var _SafeStr_4378:Boolean;


        public function get roomIndex():int
        {
            return (_SafeStr_5536);
        }

        public function get petId():int
        {
            return (_SafeStr_5431);
        }

        public function get figureData():_SafeStr_1552
        {
            return (_SafeStr_4851);
        }

        public function get hasSaddle():Boolean
        {
            return (_SafeStr_6424);
        }

        public function get isRiding():Boolean
        {
            return (_SafeStr_4378);
        }

        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_5536 = _arg_1.readInteger();
            _SafeStr_5431 = _arg_1.readInteger();
            _SafeStr_4851 = new _SafeStr_1552(_arg_1);
            _SafeStr_6424 = _arg_1.readBoolean();
            _SafeStr_4378 = _arg_1.readBoolean();
            return (true);
        }


    }
}//package _-PB

// _SafeStr_1226 = "_-LJ" (String#7967, DoABC#3)
// _SafeStr_1552 = "_-JF" (String#7795, DoABC#3)
// _SafeStr_4378 = "_-a1j" (String#8985, DoABC#3)
// _SafeStr_4851 = "_-W1C" (String#8668, DoABC#3)
// _SafeStr_5431 = "_-GK" (String#7627, DoABC#3)
// _SafeStr_5536 = "_-517" (String#6874, DoABC#3)
// _SafeStr_6424 = "_-s1Z" (String#10192, DoABC#3)


