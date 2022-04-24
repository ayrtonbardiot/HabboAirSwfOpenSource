// by nota

//_-CV.HumanGetsSnowballsFromMachineEventData

package _-CV
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class HumanGetsSnowballsFromMachineEventData extends SnowWarGameEventData 
    {

        private var _SafeStr_7190:int;
        private var _SafeStr_7191:int;

        public function HumanGetsSnowballsFromMachineEventData(_arg_1:int)
        {
            super(_arg_1);
        }

        public function get humanGameObjectId():int
        {
            return (_SafeStr_7190);
        }

        public function get snowBallMachineReference():int
        {
            return (_SafeStr_7191);
        }

        override public function parse(_arg_1:IMessageDataWrapper):void
        {
            _SafeStr_7190 = _arg_1.readInteger();
            _SafeStr_7191 = _arg_1.readInteger();
        }


    }
}//package _-CV

// _SafeStr_7190 = "_-hy" (String#9512, DoABC#3)
// _SafeStr_7191 = "_-XK" (String#8804, DoABC#3)


