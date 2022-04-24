// by nota

//login.LoginView

package login
{
    import flash.display.Sprite;
    import flash.text.TextField;
    import onBoardingHcUi.ColouredButton;
    import onBoardingHcUi.InputField;
    import flash.utils.Timer;
    import flash.events.Event;
    import onBoardingHcUi.LoaderUI;
    import flash.events.TimerEvent;
    import com.sulake.habbo.utils.CommunicationUtils;
    import flash.geom.Rectangle;
    import onBoardingHcUi.Button;

    public class LoginView extends Sprite 
    {

        private var _context:ILoginContext;
        private var _SafeStr_9212:TextField;
        private var _saveButton:ColouredButton;
        private var _cancelButton:ColouredButton;
        private var _SafeStr_9233:InputField;
        private var _loginAreaWidth:int = 640;
        private var _SafeStr_9234:InputField;
        private var _SafeStr_3853:Boolean;

        public function LoginView(_arg_1:ILoginContext)
        {
            _context = _arg_1;
            addEventListener("addedToStage", onAddedToStage);
            init();
        }

        public function dispose():void
        {
            _saveButton.dispose();
            _cancelButton.dispose();
        }

        private function onAddedToStage(_arg_1:Event):void
        {
            var _local_2:Timer = new Timer(20, 1);
            _local_2.addEventListener("timerComplete", onAlignElements);
            _local_2.start();
        }

        private function onAlignElements(_arg_1:TimerEvent):void
        {
            LoaderUI.lineUpVertically(_SafeStr_9233, -20, _SafeStr_9234);
            LoaderUI.alignAnchors(_SafeStr_9233, 0, "l", _SafeStr_9234);
            LoaderUI.alignAnchors(_SafeStr_9233, 0, "r", _saveButton);
            LoaderUI.lineUpHorizontallyRevers(_saveButton, 20, _cancelButton);
            _SafeStr_14.log(("(login) Buttons: " + [_saveButton.x, _saveButton.y, _cancelButton.x, _cancelButton.y]));
        }

        public function init():void
        {
            if (_SafeStr_3853)
            {
                return;
            };
            _SafeStr_3853 = true;
            addTitleField();
            addInputFields();
            addButtons();
        }

        private function addTitleField():void
        {
            if (!_SafeStr_9212)
            {
                _SafeStr_9212 = LoaderUI.createTextField("${connection.login.title}", 40, 0xFFFFFF, false, true, false, false, "left");
                _SafeStr_9212.x = 0;
                _SafeStr_9212.y = 0;
                _SafeStr_9212.width = 500;
                _SafeStr_9212.multiline = false;
                _SafeStr_9212.thickness = 50;
                addChild(_SafeStr_9212);
            };
        }

        private function addInputFields():void
        {
            _SafeStr_9233 = new InputField(_context, _loginAreaWidth, "${connection.login.email}", CommunicationUtils.readSOLString("login"), "${connection.login.missing_credentials}", "");
            addChild(_SafeStr_9233);
            _SafeStr_9233.x = 0;
            _SafeStr_9233.y = 100;
            _SafeStr_9234 = new InputField(_context, _loginAreaWidth, "${connection.login.password}", CommunicationUtils.restorePassword(), "", "", true);
            addChild(_SafeStr_9234);
        }

        public function addButtons():void
        {
            _cancelButton = new ColouredButton("red", "${generic.cancel}", new Rectangle(0, 300, 0, 40), true, onCancel, 0xD8D8D8);
            addChild(_cancelButton);
            _saveButton = new ColouredButton("gfreen", "${connection.login.play}", new Rectangle(0, 300, 0, 40), true, saveOutfit, 0xD8D8D8);
            _saveButton.active = false;
            addChild(_saveButton);
        }

        private function saveOutfit(_arg_1:Button):void
        {
            _context.initLogin(_SafeStr_9233.text, _SafeStr_9234.text);
        }

        private function onCancel(_arg_1:Button):void
        {
            _context.showScreen(1);
        }

        public function ready():void
        {
            if (_saveButton != false)
            {
                _saveButton.active = true;
            };
        }


    }
}//package login

// _SafeStr_14 = "_-ED" (String#7490, DoABC#3)
// _SafeStr_3853 = "_-T1w" (String#8500, DoABC#3)
// _SafeStr_9212 = "_-wE" (String#10476, DoABC#3)
// _SafeStr_9233 = "_-L1h" (String#7953, DoABC#3)
// _SafeStr_9234 = "_-Y6" (String#8860, DoABC#3)


