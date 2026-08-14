package middleware

import (
	"encoding/json"
	"net/http"
	"net/http/httptest"
	"testing"

	"github.com/QuantumNous/new-api/common"
	"github.com/gin-gonic/gin"
	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/require"
)

func TestRequestId(t *testing.T) {
	gin.SetMode(gin.TestMode)

	router := gin.New()
	router.GET("/ping", RequestId(), func(c *gin.Context) {
		id := c.GetString(common.RequestIdKey)
		require.NotEmpty(t, id)

		requestId := c.Request.Context().Value(common.RequestIdKey).(string)
		assert.Equal(t, id, requestId)

		c.JSON(http.StatusOK, gin.H{
			"message": id,
		})
	})

	recorder := httptest.NewRecorder()
	request := httptest.NewRequest(http.MethodGet, "/ping", nil)
	router.ServeHTTP(recorder, request)

	require.Equal(t, http.StatusOK, recorder.Code)
	requestID := recorder.Header().Get(common.RequestIdKey)
	require.NotEmpty(t, requestID)
	var response struct {
		Message string `json:"message"`
	}
	json.NewDecoder(recorder.Body).Decode(&response)
	assert.Equal(t, requestID, response.Message)
}
