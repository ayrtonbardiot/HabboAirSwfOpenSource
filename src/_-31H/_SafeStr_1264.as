// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-31H._SafeStr_1264

package _-31H
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1264 implements IMessageParser 
    {

        private var _SafeStr_7052:Boolean;
        private var _SafeStr_7053:int;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            this._SafeStr_7052 = _arg_1.readBoolean();
            this._SafeStr_7053 = _arg_1.readInteger();
            return (true);
        }

        public function get canCreateEvent():Boolean
        {
            return (_SafeStr_7052);
        }

        public function get errorCode():int
        {
            return (_SafeStr_7053);
        }


    }
}//package _-31H

// _SafeStr_1264 = "_-U1Y" (String#8557, DoABC#3)
// _SafeStr_7052 = "_-be" (String#9090, DoABC#3)
// _SafeStr_7053 = "_-66" (String#6980, DoABC#3)


