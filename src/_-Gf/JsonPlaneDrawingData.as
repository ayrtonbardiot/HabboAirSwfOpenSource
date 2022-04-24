// by nota

//_-Gf.JsonPlaneDrawingData

package _-Gf
{
    import __AS3__.vec.Vector;

    [SecureSWF(rename="false")]
    public class JsonPlaneDrawingData 
    {

        private var _SafeStr_4052:Number;
        private var _SafeStr_5591:Vector.<JsonPoint> = new Vector.<JsonPoint>();
        private var _color:uint;
        private var _SafeStr_5576:Array = [];
        private var _SafeStr_7252:Boolean;
        private var _SafeStr_7253:Array = [];


        public function get z():Number
        {
            return (_SafeStr_4052);
        }

        public function set z(_arg_1:Number):void
        {
            _SafeStr_4052 = _arg_1;
        }

        public function get cornerPoints():Vector.<JsonPoint>
        {
            return (_SafeStr_5591);
        }

        public function addCornerPoint(_arg_1:int, _arg_2:int):void
        {
            _SafeStr_5591.push(new JsonPoint(_arg_1, _arg_2));
        }

        public function get masks():Array
        {
            return (_SafeStr_5576);
        }

        public function addMask(_arg_1:JsonMaskDrawingData):void
        {
            _SafeStr_5576.push(_arg_1);
        }

        public function get color():uint
        {
            return (_color);
        }

        public function set color(_arg_1:uint):void
        {
            _color = _arg_1;
        }

        public function get bottomAligned():Boolean
        {
            return (_SafeStr_7252);
        }

        public function setBottomAligned(_arg_1:Boolean):void
        {
            _SafeStr_7252 = _arg_1;
        }

        public function get texCols():Array
        {
            return (_SafeStr_7253);
        }

        public function addTexCol(_arg_1:JsonTextureColumnData):void
        {
            _SafeStr_7253.push(_arg_1);
        }


    }
}//package _-Gf

// _SafeStr_4052 = "_-Rt" (String#8388, DoABC#3)
// _SafeStr_5576 = "_-8p" (String#7140, DoABC#3)
// _SafeStr_5591 = "_-r1R" (String#10126, DoABC#3)
// _SafeStr_7252 = "_-UE" (String#8572, DoABC#3)
// _SafeStr_7253 = "_-01T" (String#6481, DoABC#3)


