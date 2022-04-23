// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.window.WindowModel

package com.sulake.core.window
{
    import com.sulake.core.runtime._SafeStr_13;
    import flash.geom.Rectangle;
    import flash.geom.ColorTransform;
    import flash.geom.Point;

    public class WindowModel implements _SafeStr_13 
    {

        protected var _offsetX:int;
        protected var _offsetY:int;
        protected var _SafeStr_4050:int;
        protected var _SafeStr_4051:int;
        protected var _SafeStr_4422:int;
        protected var _SafeStr_4423:int;
        protected var _SafeStr_4431:Rectangle;
        protected var _SafeStr_4432:Rectangle;
        protected var _SafeStr_4433:Rectangle;
        protected var _SafeStr_4434:Rectangle;
        protected var _context:WindowContext;
        protected var _background:Boolean = false;
        protected var _fillColor:uint = 0xFFFFFF;
        protected var _SafeStr_4441:ColorTransform;
        protected var _alphaColor:uint;
        protected var _SafeStr_4424:uint = 10;
        protected var _SafeStr_4425:Boolean = true;
        protected var _SafeStr_4426:Boolean = true;
        protected var _SafeStr_4427:Number = 1;
        protected var _SafeStr_4428:uint;
        protected var _SafeStr_3734:uint;
        protected var _style:uint;
        protected var _SafeStr_4028:uint;
        protected var _caption:String = "";
        protected var _name:String;
        protected var _SafeStr_3820:uint;
        protected var _SafeStr_4429:Array;
        protected var _disposed:Boolean = false;
        protected var _SafeStr_4430:String = "";

        public function WindowModel(_arg_1:uint, _arg_2:String, _arg_3:uint, _arg_4:uint, _arg_5:uint, _arg_6:WindowContext, _arg_7:Rectangle, _arg_8:Array=null, _arg_9:String="")
        {
            _SafeStr_3820 = _arg_1;
            _name = _arg_2;
            _SafeStr_4028 = _arg_3;
            _SafeStr_4428 = _arg_5;
            _SafeStr_3734 = 0;
            _style = _arg_4;
            _SafeStr_4429 = _arg_8;
            _context = _arg_6;
            _SafeStr_4430 = _arg_9;
            _SafeStr_4050 = _arg_7.x;
            _SafeStr_4051 = _arg_7.y;
            _SafeStr_4422 = _arg_7.width;
            _SafeStr_4423 = _arg_7.height;
            _SafeStr_4431 = _arg_7.clone();
            _SafeStr_4432 = _arg_7.clone();
        }

        public function get x():int
        {
            return (_SafeStr_4050);
        }

        public function get y():int
        {
            return (_SafeStr_4051);
        }

        public function get width():int
        {
            return (_SafeStr_4422);
        }

        public function get height():int
        {
            return (_SafeStr_4423);
        }

        public function get position():Point
        {
            return (new Point(_SafeStr_4050, _SafeStr_4051));
        }

        public function get rectangle():Rectangle
        {
            return (new Rectangle(_SafeStr_4050, _SafeStr_4051, _SafeStr_4422, _SafeStr_4423));
        }

        public function get context():_SafeStr_3160
        {
            return (_context);
        }

        public function get mouseThreshold():uint
        {
            return (_SafeStr_4424);
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get background():Boolean
        {
            return (_background);
        }

        public function get clipping():Boolean
        {
            return (_SafeStr_4425);
        }

        public function get visible():Boolean
        {
            return (_SafeStr_4426);
        }

        public function get color():uint
        {
            return (_fillColor);
        }

        public function get alpha():uint
        {
            return (_alphaColor >>> 24);
        }

        public function get blend():Number
        {
            return (_SafeStr_4427);
        }

        public function get param():uint
        {
            return (_SafeStr_4428);
        }

        public function get state():uint
        {
            return (_SafeStr_3734);
        }

        public function get style():uint
        {
            return (_style);
        }

        public function get type():uint
        {
            return (_SafeStr_4028);
        }

        public function get caption():String
        {
            return (_caption);
        }

        public function get name():String
        {
            return (_name);
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get tags():Array
        {
            return ((_SafeStr_4429) ? _SafeStr_4429 : _SafeStr_4429 = []);
        }

        public function get left():int
        {
            return (_SafeStr_4050);
        }

        public function get top():int
        {
            return (_SafeStr_4051);
        }

        public function get right():int
        {
            return (_SafeStr_4050 + _SafeStr_4422);
        }

        public function get bottom():int
        {
            return (_SafeStr_4051 + _SafeStr_4423);
        }

        public function get renderingX():int
        {
            return (_offsetX + _SafeStr_4050);
        }

        public function get renderingY():int
        {
            return (_offsetY + _SafeStr_4051);
        }

        public function get renderingWidth():int
        {
            return (_SafeStr_4422 + Math.abs(etchingPoint.x));
        }

        public function get renderingHeight():int
        {
            return (_SafeStr_4423 + Math.abs(etchingPoint.y));
        }

        public function get renderingRectangle():Rectangle
        {
            return (new Rectangle(renderingX, renderingY, renderingWidth, renderingHeight));
        }

        public function get etchingPoint():Point
        {
            return (new Point(0, 0));
        }

        public function get dynamicStyle():String
        {
            return (_SafeStr_4430);
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                _disposed = true;
                _context = null;
                _SafeStr_3734 = 0x40000000;
                _SafeStr_4429 = null;
                _SafeStr_4050 = (_SafeStr_4051 = (_SafeStr_4422 = (_SafeStr_4423 = 0)));
            };
        }

        public function invalidate(_arg_1:Rectangle=null):void
        {
        }

        public function getInitialWidth():int
        {
            return (_SafeStr_4431.width);
        }

        public function getInitialHeight():int
        {
            return (_SafeStr_4431.height);
        }

        public function getPreviousWidth():int
        {
            return (_SafeStr_4432.width);
        }

        public function getPreviousHeight():int
        {
            return (_SafeStr_4432.height);
        }

        public function getMinimizedWidth():int
        {
            return ((_SafeStr_4433) ? _SafeStr_4433.width : 0);
        }

        public function getMinimizedHeight():int
        {
            return ((_SafeStr_4433) ? _SafeStr_4433.height : 0);
        }

        public function getMaximizedWidth():int
        {
            return ((_SafeStr_4434) ? _SafeStr_4434.width : 2147483647);
        }

        public function getMaximizedHeight():int
        {
            return ((_SafeStr_4434) ? _SafeStr_4434.height : 2147483647);
        }

        public function testTypeFlag(_arg_1:uint, _arg_2:uint=0):Boolean
        {
            if (_arg_2 > 0)
            {
                return (((_SafeStr_4028 & _arg_2) ^ _arg_1) == 0);
            };
            return ((_SafeStr_4028 & _arg_1) == _arg_1);
        }

        public function testStateFlag(_arg_1:uint, _arg_2:uint=0):Boolean
        {
            if (_arg_2 > 0)
            {
                return (((_SafeStr_3734 & _arg_2) ^ _arg_1) == 0);
            };
            return ((_SafeStr_3734 & _arg_1) == _arg_1);
        }

        public function testStyleFlag(_arg_1:uint, _arg_2:uint=0):Boolean
        {
            if (_arg_2 > 0)
            {
                return (((_style & _arg_2) ^ _arg_1) == 0);
            };
            return ((_style & _arg_1) == _arg_1);
        }

        public function testParamFlag(_arg_1:uint, _arg_2:uint=0):Boolean
        {
            if (_arg_2 > 0)
            {
                return (((_SafeStr_4428 & _arg_2) ^ _arg_1) == 0);
            };
            return ((_SafeStr_4428 & _arg_1) == _arg_1);
        }


    }
}//package com.sulake.core.window

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_3160 = "_-dQ" (String#2821, DoABC#4)
// _SafeStr_3734 = "_-g1U" (String#198, DoABC#4)
// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_4028 = "_-81R" (String#336, DoABC#4)
// _SafeStr_4050 = "_-22N" (String#402, DoABC#4)
// _SafeStr_4051 = "_-1L" (String#429, DoABC#4)
// _SafeStr_4422 = "_-a1T" (String#1398, DoABC#4)
// _SafeStr_4423 = "_-Ht" (String#1496, DoABC#4)
// _SafeStr_4424 = "_-Rw" (String#6835, DoABC#4)
// _SafeStr_4425 = "_-Ed" (String#9290, DoABC#4)
// _SafeStr_4426 = "_-c1l" (String#1501, DoABC#4)
// _SafeStr_4427 = "_-x1" (String#2030, DoABC#4)
// _SafeStr_4428 = "_-ZC" (String#1519, DoABC#4)
// _SafeStr_4429 = "_-91w" (String#5040, DoABC#4)
// _SafeStr_4430 = "_-c1a" (String#7412, DoABC#4)
// _SafeStr_4431 = "_-81Z" (String#4644, DoABC#4)
// _SafeStr_4432 = "_-P17" (String#2006, DoABC#4)
// _SafeStr_4433 = "_-O3" (String#3837, DoABC#4)
// _SafeStr_4434 = "_-Pk" (String#3776, DoABC#4)
// _SafeStr_4441 = "_-WM" (String#14144, DoABC#4)


