// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-61T._SafeStr_1520

package _-61T
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1520 implements IMessageParser 
    {

        private var _SafeStr_5536:int;
        private var _SafeStr_6204:int;
        private var _status:int;
        private var _habboGroupName:String;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_5536 = _arg_1.readInteger();
            _SafeStr_6204 = _arg_1.readInteger();
            _status = _arg_1.readInteger();
            _habboGroupName = _arg_1.readString();
            return (true);
        }

        public function get roomIndex():int
        {
            return (_SafeStr_5536);
        }

        public function get habboGroupId():int
        {
            return (_SafeStr_6204);
        }

        public function get status():int
        {
            return (_status);
        }

        public function get habboGroupName():String
        {
            return (_habboGroupName);
        }


    }
}//package _-61T

// _SafeStr_1520 = "_-X1o" (String#8784, DoABC#3)
// _SafeStr_5536 = "_-517" (String#6874, DoABC#3)
// _SafeStr_6204 = "_-Gj" (String#7641, DoABC#3)


