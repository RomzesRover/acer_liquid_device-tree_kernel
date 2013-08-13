package com.BBsRs.liquidparts;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;

public class LiquidPartsActivity extends Activity {
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        BashCommand.doCmds("su","");
        Intent start = new Intent (getApplicationContext(), MainActivity.class);
		startActivity(start);
       finish();
    }
}