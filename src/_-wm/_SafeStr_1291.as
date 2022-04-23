// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-wm._SafeStr_1291

package _-wm
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1291 implements IMessageParser 
    {

        private var _SafeStr_7053:int;
        private var _SafeStr_4128:int;
        private var _SafeStr_4132:String;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            this._SafeStr_7053 = _arg_1.readInteger();
            this._SafeStr_4128 = _arg_1.readInteger();
            this._SafeStr_4132 = _arg_1.readString();
            return (true);
        }

        public function get errorCode():int
        {
            return (this._SafeStr_7053);
        }

        public function get userId():int
        {
            return (this._SafeStr_4128);
        }

        public function get message():String
        {
            return (this._SafeStr_4132);
        }


    }
}//package _-wm

// _SafeStr_1291 = "_-RU" (String#8377, DoABC#3)
// _SafeStr_4128 = "_-q1y" (String#10067, DoABC#3)
// _SafeStr_4132 = "_-s1S" (String#10186, DoABC#3)
// _SafeStr_7053 = "_-66" (String#6980, DoABC#3)


