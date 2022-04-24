// by nota

//com.sulake.core.window.components.BitmapDataController

package com.sulake.core.window.components
{
    import com.sulake.core.window.WindowController;
    import com.sulake.core.window.utils._SafeStr_3250;
    import flash.display.BitmapData;
    import flash.geom.Point;
    import com.sulake.core.window.theme._SafeStr_3283;
    import com.sulake.core.window.enum.PivotPoint;
    import com.sulake.core.window.WindowContext;
    import flash.geom.Rectangle;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.utils.PropertyStruct;

    public class BitmapDataController extends WindowController implements _SafeStr_3250 
    {

        protected var _bitmapData:BitmapData;
        protected var _SafeStr_4353:uint;
        protected var _SafeStr_6188:Boolean;
        protected var _SafeStr_6189:Boolean;
        protected var _SafeStr_6190:Number;
        protected var _SafeStr_6191:Number;
        protected var _SafeStr_6192:Boolean;
        protected var _etchingColor:uint;
        protected var _etchingPoint:Point = new Point(0, -1);
        protected var _SafeStr_6193:Boolean;
        private var _SafeStr_6194:Boolean;
        private var _SafeStr_6195:Boolean;

        public function BitmapDataController(_arg_1:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:WindowContext, _arg_6:Rectangle, _arg_7:_SafeStr_3109, _arg_8:Function=null, _arg_9:Array=null, _arg_10:Array=null, _arg_11:uint=0)
        {
            var _local_12:_SafeStr_3283 = _arg_5.getWindowFactory().getThemeManager().getPropertyDefaults(_arg_3);
            _SafeStr_4353 = PivotPoint.pivotFromName(_local_12.get("pivot_point").value);
            _SafeStr_6188 = _local_12.get("stretched_x").value;
            _SafeStr_6189 = _local_12.get("stretched_y").value;
            _SafeStr_6190 = _local_12.get("zoom_x").value;
            _SafeStr_6191 = _local_12.get("zoom_y").value;
            _SafeStr_6194 = _local_12.get("wrap_x").value;
            _SafeStr_6195 = _local_12.get("wrap_y").value;
            super(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11);
        }

        override public function dispose():void
        {
            _bitmapData = null;
            super.dispose();
        }

        public function get bitmapData():BitmapData
        {
            return (_bitmapData);
        }

        public function get pivotPoint():uint
        {
            return (_SafeStr_4353);
        }

        public function set pivotPoint(_arg_1:uint):void
        {
            _SafeStr_4353 = _arg_1;
        }

        public function get stretchedX():Boolean
        {
            return (_SafeStr_6188);
        }

        public function set stretchedX(_arg_1:Boolean):void
        {
            _SafeStr_6188 = _arg_1;
        }

        public function get stretchedY():Boolean
        {
            return (_SafeStr_6189);
        }

        public function set stretchedY(_arg_1:Boolean):void
        {
            _SafeStr_6189 = _arg_1;
        }

        public function get zoomX():Number
        {
            return (_SafeStr_6190);
        }

        public function set zoomX(_arg_1:Number):void
        {
            _SafeStr_6190 = _arg_1;
            fitSize();
        }

        public function get zoomY():Number
        {
            return (_SafeStr_6191);
        }

        public function set zoomY(_arg_1:Number):void
        {
            _SafeStr_6191 = _arg_1;
            fitSize();
        }

        public function get greyscale():Boolean
        {
            return (_SafeStr_6192);
        }

        public function set greyscale(_arg_1:Boolean):void
        {
            _SafeStr_6192 = _arg_1;
        }

        public function get etchingColor():uint
        {
            return (_etchingColor);
        }

        public function set etchingColor(_arg_1:uint):void
        {
            _etchingColor = _arg_1;
        }

        public function get fitSizeToContents():Boolean
        {
            return (_SafeStr_6193);
        }

        public function set fitSizeToContents(_arg_1:Boolean):void
        {
            _SafeStr_6193 = _arg_1;
            fitSize();
        }

        override public function get etchingPoint():Point
        {
            return (_etchingPoint);
        }

        override public function set etching(_arg_1:Array):void
        {
            etchingColor = _arg_1[0];
            _etchingPoint = new Point(_arg_1[1], _arg_1[2]);
        }

        public function get wrapX():Boolean
        {
            return (_SafeStr_6194);
        }

        public function set wrapX(_arg_1:Boolean):void
        {
            _SafeStr_6194 = _arg_1;
        }

        public function get wrapY():Boolean
        {
            return (_SafeStr_6195);
        }

        public function set wrapY(_arg_1:Boolean):void
        {
            _SafeStr_6195 = _arg_1;
        }

        protected function fitSize():void
        {
            if (((_SafeStr_6193) && (!(_bitmapData == null))))
            {
                width = Math.abs((_bitmapData.width * _SafeStr_6190));
                height = Math.abs((_bitmapData.height * _SafeStr_6191));
            };
        }

        override public function get properties():Array
        {
            var _local_1:Array = super.properties;
            _local_1.push(createProperty("pivot_point", PivotPoint.PIVOT_NAMES[_SafeStr_4353]));
            _local_1.push(createProperty("stretched_x", _SafeStr_6188));
            _local_1.push(createProperty("stretched_y", _SafeStr_6189));
            _local_1.push(createProperty("wrap_x", _SafeStr_6194));
            _local_1.push(createProperty("wrap_y", _SafeStr_6195));
            _local_1.push(createProperty("zoom_x", _SafeStr_6190));
            _local_1.push(createProperty("zoom_y", _SafeStr_6191));
            _local_1.push(createProperty("greyscale", _SafeStr_6192));
            _local_1.push(createProperty("etching_color", _etchingColor));
            _local_1.push(createProperty("fit_size_to_contents", _SafeStr_6193));
            return (_local_1);
        }

        override public function set properties(_arg_1:Array):void
        {
            for each (var _local_2:PropertyStruct in _arg_1)
            {
                switch (_local_2.key)
                {
                    case "pivot_point":
                        _SafeStr_4353 = PivotPoint.pivotFromName(_local_2.value);
                        break;
                    case "stretched_x":
                        _SafeStr_6188 = _local_2.value;
                        break;
                    case "stretched_y":
                        _SafeStr_6189 = _local_2.value;
                        break;
                    case "zoom_x":
                        _SafeStr_6190 = _local_2.value;
                        break;
                    case "zoom_y":
                        _SafeStr_6191 = _local_2.value;
                        break;
                    case "wrap_x":
                        _SafeStr_6194 = _local_2.value;
                        break;
                    case "wrap_y":
                        _SafeStr_6195 = _local_2.value;
                        break;
                    case "greyscale":
                        _SafeStr_6192 = _local_2.value;
                        break;
                    case "etching_color":
                        _etchingColor = _local_2.value;
                        break;
                    case "fit_size_to_contents":
                        fitSizeToContents = (_local_2.value as Boolean);
                };
            };
            super.properties = _arg_1;
        }


    }
}//package com.sulake.core.window.components

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3250 = "_-J1u" (String#3192, DoABC#4)
// _SafeStr_3283 = "_-EE" (String#9283, DoABC#4)
// _SafeStr_4353 = "_-n1x" (String#5153, DoABC#4)
// _SafeStr_6188 = "_-rN" (String#8549, DoABC#4)
// _SafeStr_6189 = "_-2U" (String#8321, DoABC#4)
// _SafeStr_6190 = "_-V1h" (String#7471, DoABC#4)
// _SafeStr_6191 = "_-p1n" (String#7764, DoABC#4)
// _SafeStr_6192 = "_-oF" (String#10757, DoABC#4)
// _SafeStr_6193 = "_-T1S" (String#11770, DoABC#4)
// _SafeStr_6194 = "_-1D" (String#8492, DoABC#4)
// _SafeStr_6195 = "_-Nm" (String#7986, DoABC#4)


