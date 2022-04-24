// by nota

//_-CV.NewMoveTargetEventData

package _-CV
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class NewMoveTargetEventData extends SnowWarGameEventData 
    {

        private var _SafeStr_7190:int;
        private var _SafeStr_4050:int;
        private var _SafeStr_4051:int;

        public function NewMoveTargetEventData(_arg_1:int)
        {
            super(_arg_1);
        }

        public function get humanGameObjectId():int
        {
            return (_SafeStr_7190);
        }

        public function get x():int
        {
            return (_SafeStr_4050);
        }

        public function get y():int
        {
            return (_SafeStr_4051);
        }

        override public function parse(_arg_1:IMessageDataWrapper):void
        {
            _SafeStr_7190 = _arg_1.readInteger();
            _SafeStr_4050 = _arg_1.readInteger();
            _SafeStr_4051 = _arg_1.readInteger();
        }


    }
}//package _-CV

// _SafeStr_4050 = "_-22N" (String#6666, DoABC#3)
// _SafeStr_4051 = "_-1L" (String#6600, DoABC#3)
// _SafeStr_7190 = "_-hy" (String#9512, DoABC#3)


