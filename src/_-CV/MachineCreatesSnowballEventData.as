// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-CV.MachineCreatesSnowballEventData

package _-CV
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class MachineCreatesSnowballEventData extends SnowWarGameEventData 
    {

        private var _SafeStr_7191:int;

        public function MachineCreatesSnowballEventData(_arg_1:int)
        {
            super(_arg_1);
        }

        public function get snowBallMachineReference():int
        {
            return (_SafeStr_7191);
        }

        override public function parse(_arg_1:IMessageDataWrapper):void
        {
            _SafeStr_7191 = _arg_1.readInteger();
        }


    }
}//package _-CV

// _SafeStr_7191 = "_-XK" (String#8804, DoABC#3)


