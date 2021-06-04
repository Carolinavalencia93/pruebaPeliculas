package com.example.pysta;

import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.inputmethod.InputMethodManager;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.example.pysta.dataAccess.Endpoints;
import com.example.pysta.dataAccess.RetrofitClientInstance;
import com.example.pysta.dataAccess.SqliteRoutines;
import com.example.pysta.models.Clientes;
import com.example.pysta.models.Vendedor;
import com.google.gson.JsonArray;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.Serializable;
import java.util.ArrayList;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class MainActivity extends AppCompatActivity {

    private Button btnLogin;
    private EditText edtEmail,edtContraseña;
    private String contraseña, email,correoUsuario,rolUsuario,nombreVendedor,telefonoVendedor,idZonaVendedor;
    private int idUsuario;
    private Vendedor vendedor;
    private SqliteRoutines sqliteRoutines;
    private JSONArray jsonArrayClientes;
    private JSONArray clientesArray = new JSONArray();
    Clientes clientes;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        btnLogin = findViewById(R.id.btnLogin);
        edtEmail = findViewById(R.id.edtEmail);
        edtContraseña = findViewById(R.id.edtContraseña);

        edtEmail.setText("carolina@gmail.com");
        edtContraseña.setText("123456789");

        sqliteRoutines = new SqliteRoutines(this);
        obtenerClientes();
        btnLogin.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                email = edtEmail.getText().toString();
                contraseña = edtContraseña.getText().toString();
                if (email.equals("") && contrase�