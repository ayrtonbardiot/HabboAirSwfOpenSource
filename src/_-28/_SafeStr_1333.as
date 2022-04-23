// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-28._SafeStr_1333

package _-28
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-Zz._SafeStr_1552;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1333 implements IMessageParser 
    {

        private var _SafeStr_5431:int;
        private var _SafeStr_7006:String;
        private var _SafeStr_3623:int;
        private var _SafeStr_4851:_SafeStr_1552;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_5431 = _arg_1.readInteger();
            _SafeStr_7006 = _arg_1.readString();
            _SafeStr_3623 = _arg_1.readInteger();
            _SafeStr_4851 = new _SafeStr_1552(_arg_1);
            return (true);
        }

        public function get petId():int
        {
            return (_SafeStr_5431);
        }

        public function get petName():String
        {
            return (_SafeStr_7006);
        }

        public function get level():int
        {
            return (_SafeStr_3623);
        }

        public function get figureData():_SafeStr_1552
        {
            return (_SafeStr_4851);
        }


    }
}//package _-28

// _SafeStr_1333 = "_-W1R" (String#8708, DoABC#3)
// _SafeStr_1552 = "_-JF" (String#7795, DoABC#3)
// _SafeStr_3623 = "_-OF" (String#8175, DoABC#3)
// _SafeStr_4851 = "_-W1C" (String#8668, DoABC#3)
// _SafeStr_5431 = "_-GK" (String#7627, DoABC#3)
// _SafeStr_7006 = "_-6E" (String#6983, DoABC#3)


