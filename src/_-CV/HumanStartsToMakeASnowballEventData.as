// by nota

//_-CV.HumanStartsToMakeASnowballEventData

package _-CV
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class HumanStartsToMakeASnowballEventData extends SnowWarGameEventData 
    {

        private var _SafeStr_7190:int;

        public function HumanStartsToMakeASnowballEventData(_arg_1:int)
        {
            super(_arg_1);
        }

        public function get humanGameObjectId():int
        {
            return (_SafeStr_7190);
        }

        override public function parse(_arg_1:IMessageDataWrapper):void
        {
            _SafeStr_7190 = _arg_1.readInteger();
        }


    }
}//package _-CV

// _SafeStr_7190 = "_-hy" (String#9512, DoABC#3)


