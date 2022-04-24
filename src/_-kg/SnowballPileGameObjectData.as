// by nota

//_-kg.SnowballPileGameObjectData

package _-kg
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class SnowballPileGameObjectData extends SnowWarGameObjectData 
    {

        public static const _SafeStr_7359:int = 7;

        public function SnowballPileGameObjectData(_arg_1:int, _arg_2:int)
        {
            super(_arg_1, _arg_2);
        }

        override public function parse(_arg_1:IMessageDataWrapper):void
        {
            parseVariables(_arg_1, 7);
        }

        public function get locationX3D():int
        {
            return (getVariable(2));
        }

        public function get locationY3D():int
        {
            return (getVariable(3));
        }

        public function get maxSnowballs():int
        {
            return (getVariable(4));
        }

        public function get snowballCount():int
        {
            return (getVariable(5));
        }

        public function get fuseObjectId():int
        {
            return (getVariable(6));
        }


    }
}//package _-kg

// _SafeStr_7359 = "_-XY" (String#8809, DoABC#3)


